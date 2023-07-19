provider "gitlab" {
  token    = var.gitlab_token
  base_url = var.gitlab_url
}

module "gitlab_init" {
  source = "./modules/gitlab_init"

  grp_name  = var.group_name
  grp_path  = var.group_path
  grp_descr = var.group_descr

  proj_name  = var.project_name
  proj_path  = var.project_path
  proj_descr = var.project_descr

  grp_token_exp_in  = var.group_access_exp
  proj_token_exp_in = var.project_access_exp
  dpl_exp_in        = var.deployment_exp_in

  #####
  gitlab_api_token    = var.gitlab_token
  gitlab_base_url = var.gitlab_url
}