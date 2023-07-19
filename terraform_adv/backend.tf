## Declare a remote backend of s3 type. We use minIO object data storage
## access key id and secret key should be defined in terraform init command
## > terraform init -backend-config="access_key=$MINIO_ROOT_USER" \
##                  -backend-config="secret_key=$MINIO_ROOT_PASSWORD"
terraform {
  backend "s3" {
    region                      = "us-east-1"
    endpoint                    = "http://192.168.1.10:9000"
    bucket                      = "tf-state-adv"
    key                         = "terraform.tfstate"
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_metadata_api_check     = true
    force_path_style            = true

  }
}