## Declare a remote backend of s3 type. We use minIO object data storage
## access key id and secret key should be defined in terraform init command
## > terraform init -backend-config="access_key=$MINIO_ROOT_USER" \
##                  -backend-config="secret_key=$MINIO_ROOT_PASSWORD"
terraform {
  backend "s3" {
    region     = "us-east-1"
    endpoint   = "http://192.168.1.10:9000"
    bucket     = "tf-state"
    key        = "terraform.tfstate"
    skip_requesting_account_id = true
    skip_credentials_validation = true
    skip_get_ec2_platforms = true
    skip_metadata_api_check = true
    force_path_style = true
  }
}

provider "gitlab" {
  token    = var.gitlab_token
  base_url = var.gitlab_url
}

## GitLab group
resource "gitlab_group" "gr1" {
  name             = "Configuration Management"
  path             = "cfg-mgm"
  description      = "A group dedicated to Configuration Management practices"
  visibility_level = "public"

}

## Group variable MYVAR
resource "gitlab_group_variable" "gr1_var_MYVAR" {
  group             = gitlab_group.gr1.id
  key               = "MYVAR"
  value             = "TRUE"
  protected         = false
  masked            = false
  environment_scope = "*"
}

## GitLab project belonging to the group above
resource "gitlab_project" "pr1" {
  # checkov:skip=CKV_GLB_1: ADD REASON
  # checkov:skip=CKV_GLB_4: ADD REASON
  name                   = "Gitlab Configuration with Terraform"
  description            = "A repo for terraform configurations"
  visibility_level       = "public"
  path                   = "gitlab_terraform"
  initialize_with_readme = "true"
  namespace_id           = gitlab_group.gr1.id
  push_rules {
    prevent_secrets = true
  }
}


## Access token to the project
resource "gitlab_project_access_token" "pr_tok1" {
  project      = gitlab_project.pr1.id
  name         = "Project access token"
  expires_at   = var.pr_token_exp
  access_level = "guest"
  scopes       = ["api"]
}