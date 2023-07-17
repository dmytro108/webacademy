terraform {
  required_version = ">= 1.5.0"
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.1.0"
    }
  }

}
