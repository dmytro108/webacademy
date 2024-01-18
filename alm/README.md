# Portfolio Project: Optimizing DevOps Workflow with Docker, GitLab, Minio, and Terraform
## Scenario:
Your IT company encountered challenges such as inconsistent project setups and inefficient management of large files. As a member of the DevOps team, the aim is to optimize the company's DevOps processes. The primary goal is to implement a pilot solution demonstrating how these issues could be resolved by integrating GitLab with Minio S3 as a GitLab Large File Storage (LFS) solution, and adopting an Infrastructure as Code (IaC) approach for streamlined project onboarding. 
## Tasks:
1. Set up and configure: 
	- GitLab CE server
	- GitLab CI/CD runner
	- Minio S3 storrage server
	- SonarQube
2. Configure GitLab to use Minio as a GitLab LFS backend for handling large files
3. Configure GitLab to use SonarQube for static code analysis.
4. Write a Terraform module for creating resources on the GitLab server, and use it in the main configuration to create a standard project environment on the GitLab server. Use Minio S3 as a terraform backend and use Terragrunt to wrap backend and provider recources. The following GitLab resources should be created:
	- group
	- project
	- gitlab_group_access_token
	- gitlab_deploy_token
	- gitlab_branch_protection
5. Generate documentation using terraform-docs.
6. Verify the terraform code using external tools: tfsec, tflint and checkov
## Solution
### Set up GitLab AML toolset
The goal was to develop a pilot solution, for which I opted to deploy all system components within Docker, utilizing Docker Compose for straightforward orchestration. The configuration was delineated in a [Docker Compose file](gitlab/docker-compose.yaml), encompassing the following components:
- **GitLab EE** in its latest version, to serve as the core platform for version control and CI/CD.
- **Minio S3 server**, chosen for efficient large file storage and management.
- **GitLab CI/CD Runner**, to facilitate continuous integration and deployment processes.
- **SonarQube CE server**, integrated to perform static code analysis.
- **PostgreSQL server**, specifically required to support SonarQube operations.

Environment variables, crucial for the operation of each container, were meticulously set in separate environment files.
All these containers were configured to operate on a shared Bridge network for efficient communication. The Minio container was assigned a specific IPv4 address to ensure reliable access.
```yaml
## ------------- Network -------------------
# GitLab IP: 192.168.1.30
# Minio IP: 192.168.1.10
networks:
  gitlab_minio:
    ipam:
      driver: default
      config:
        - subnet: "192.168.1.0/24"
```
#### Minio S3
To initialize Minio buckets, an initialization container utilizing the Minio CLI was employed:
```yaml
## ------------- Minio initialization container -------------------
  createbuckets:
    image: minio/mc
    container_name: createbuckets

    env_file:
      - buckets.env
      - minio.env
    entrypoint: >
      /bin/sh -c "
      /usr/bin/mc alias set lfs-obj http://192.168.1.10:9000 ${MINIO_ROOT_USER} ${MINIO_ROOT_PASSWORD};
      /usr/bin/mc mb lfs-obj/${ARTIFACTS};
      /usr/bin/mc mb lfs-obj/${DIFFS};
      /usr/bin/mc mb lfs-obj/${LFS};
      ...
      /usr/bin/mc policy set public lfs-obj/${ARTIFACTS};
      /usr/bin/mc policy set public lfs-obj/${DIFFS};
      /usr/bin/mc policy set public lfs-obj/${LFS};

      exit 0;
      "
    depends_on:
      - minio

    networks:
      gitlab_minio:      
```

The GitLab container was configured to use Minio as its LFS backend:
```yaml
    environment:
      # enable Git Large File Storage (LFS) and interfacing with an object storage system Minio
      # The endpoint parameter points to the Minio server      
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'http://${GITLAB_HOST}:8888'
        gitlab_rails['gitlab_shell_ssh_port'] = 2224
        gitlab_rails['lfs_enabled'] = true
        gitlab_rails['object_store']['enabled'] = true
        gitlab_rails['object_store']['proxy_download'] = true
        gitlab_rails['object_store']['connection'] = {
          'provider' => 'AWS',
          'region' => 'us-east-1',
          'endpoint' => 'http://192.168.1.10:9000',
          'path_style' => true,
          'aws_access_key_id' => '$MINIO_ROOT_USER',
          'aws_secret_access_key' => '$MINIO_ROOT_PASSWORD'
        }
        gitlab_rails['object_store']['objects']['artifacts']['bucket'] = '${ARTIFACTS}'
        gitlab_rails['object_store']['objects']['external_diffs']['bucket'] = '${DIFFS}'
        gitlab_rails['object_store']['objects']['lfs']['bucket'] = '${LFS}'
      .....
```

#### SonarQube
SonarQube was integrated into the system to perform static code analysis. The SonarQube container was configured to use PostgreSQL as its database backend.

#### GitLab CI/CD Runner
The GitLab CI/CD Runner container was configured to use the Docker socket from the host Linux system to enable the Runner running Docker containers within CI/CD pipelines. This setup ensured seamless integration and operational efficiency of the entire system. 

```yaml
## --------------------------- GitLab CI/CD Runner -----------------------------  
  gitlab-cicd-runner:
    image: gitlab/gitlab-runner:latest
    container_name:  gitlab-runner

    volumes:
      - '/srv/gitlab-runner/config:/etc/gitlab-runner'
      - '/var/run/docker.sock:/var/run/docker.sock'

    networks:
      gitlab_minio:

    restart: always    
    depends_on:
      - gitlab
```
### Terraform
Utilizing Terraform's powerful Infrastructure as Code (IaC) capabilities, a [Terraform configuration](project-iac/) was designed to interact seamlessly with the GitLab API for the creation and provisioning of ALM infrastructure tailored for project environments. A [Terraform module](project-iac/modules/gitlab_init/) was developed to facilitate the establishment of a project on the GitLab server. This module not only created the project within the group but also generated necessary access and deployment tokens, including gitlab_group_access_token, gitlab_deploy_token, and gitlab_branch_protection.

Previously luanched Minio S3 server was employed as a backend for storing Terraform state files, ensuring a reliable and secure management of infrastructure state.
```hcl
terraform {
  backend "s3" {
    bucket                      = "tf-state-dev"
    endpoint                    = "http://192.168.1.10:9000"
    force_path_style            = true
    key                         = "terraform.tfstate"
    region                      = "us-east-1"
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  }
}
```
To facilitate a range of environments across multiple project, the [Terragrunt template](project-iac/terragrunt.hcl) engine is employed. This engine enables the specification of various crucial elements, including the provider (the GitLab API endpoint), the backend for the state file, and [essential metadata](project-iac/environment/webac.tfvars) for initializing projects, such as project name and description.

To uphold the integrity and quality of the Terraform configuration, the [tf-lint tool](project-iac/.tflint.hcl) was utilized for meticulous linting, ensuring best practices and consistency in the code.

Additionally, [the documentation](project-iac/.terraform-docs.yml) for the Terraform configuration and the module was automatically generated using terraform-docs. 
