## Access token to the project
resource "gitlab_project_access_token" "proj_token_dev" {
  project      = gitlab_project.proj.id
  name         = "Project access token"
  expires_at   = var.proj_token_exp_in #formatdate("YYYY-MM-DD", timeadd(timestamp(), var.proj_token_exp_in))
  access_level = "guest"
  scopes       = ["api"]
}

## Deploy access tocken
resource "gitlab_deploy_token" "grp_token_dpl" {
  group      = gitlab_group.pub_grp.id
  name       = "Group deploy token"
  expires_at = timeadd(timestamp(), var.dpl_exp_in)
  scopes     = ["read_repository", "read_registry"]
}

## Group access token
resource "gitlab_group_access_token" "grp_token_dev" {
  group        = gitlab_group.pub_grp.id
  name         = "Group access token"
  expires_at   = var.grp_token_exp_in #formatdate("YYYY-MM-DD", timeadd(timestamp(), var.grp_token_exp_in))
  access_level = "developer"
  scopes       = ["api"]
}