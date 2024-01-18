remote_state {
  backend = "s3"
  disable_init = true

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket                        = "tf-state-${get_env("ENV_SET")}"
    region                        = "us-east-1"
    endpoint                      = "http://192.168.1.10:9000"
    key                           = "terraform.tfstate"
    skip_requesting_account_id   = true
    skip_credentials_validation   = true
    skip_get_ec2_platforms       = true
    skip_metadata_api_check       = true
    force_path_style              = true
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "gitlab" {
  token    = var.gitlab_token
  base_url = var.gitlab_url
}
EOF
}

