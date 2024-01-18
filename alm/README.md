# Portfolio Project: Optimizing DevOps Workflow with Docker, GitLab, Minio, and Terraform
## Scenario:
Your IT company encountered challenges such as inconsistent project setups and inefficient management of large files. As a member of the DevOps team, the aim is to optimize the company's DevOps processes. The primary goal is to implement a pilot solution demonstrating how these issues could be resolved by integrating GitLab with Minio S3 as a GitLab Large File Storage (LFS) solution, and adopting an Infrastructure as Code (IaC) approach for streamlined project onboarding. 
## Tasks:
1. Set up and configure in a Docker containers: 
	- GitLab CE server
	- GitLab CI/CD runner
	- Minio S3 storrage server
	- SonarQube
1. Configure GitLab to use Minio as a GitLab LFS backend for handling large files
1. Configure GitLab to use SonarQube for static code analysis.
1. Write a Terraform module for creating resources on the GitLab server, and use it in the main configuration to create a standard project environment on the GitLab server. Use Minio S3 as a terraform backend and use Terragrunt to wrap backend and provider recources. The following GitLab resources should be created:
	- group
	- project
	- gitlab_group_access_token
	- gitlab_deploy_token
	- gitlab_branch_protection
1. Generate documentation using terraform-docs.
1. Verify the terraform code using external tools: tfsec, tflint and checkov
## Solution