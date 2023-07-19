module "gitlab_init" {
  source = "./modules/gitlab_init"

  # Group variables
  grp_name  = "StartUps"
  grp_path  = "strt"
  grp_descr = "Start-up projects"

  # Project variables
  proj_name  = "Project sources 1"
  proj_path  = "proj1"
  proj_descr = "An awesom app"

  # Tokens expiration variables
  grp_token_exp  = "2023-08-01"
  proj_token_exp = "2023-08-01"
  dpl_exp_in     = "24h"

  # Gitlab API
  gitlab_api_token = "f88b6f47-c4cf-4e98-a205-132b90b697d8"
  gitlab_base_url  = "http://gitlab.example.com/api/v4/"
}