
## GitLab group
resource "gitlab_group" "pub_grp" {
  name             = var.grp_name
  path             = var.grp_path
  description      = var.grp_descr
  visibility_level = "public"
}

## GitLab project belonging to the group above
resource "gitlab_project" "proj" {
  # checkov:skip=CKV_GLB_1: ADD REASON
  name                   = var.proj_name
  description            = var.proj_descr
  visibility_level       = "public"
  path                   = var.proj_path
  initialize_with_readme = "true"
  namespace_id           = gitlab_group.pub_grp.id
  default_branch         = "main"

  provisioner "local-exec" {
    command = "curl -X DELETE --header 'PRIVATE-TOKEN: ${var.gitlab_api_token}' '${var.gitlab_base_url}/projects/${self.id}/protected_branches/main'"


  }

  #push_rules {
  #  reject_unsigned_commits = true
  #  prevent_secrets         = true
  #}
}



## Protected branch
resource "gitlab_branch_protection" "main" {
  project                = gitlab_project.proj.id
  branch                 = gitlab_project.proj.default_branch
  push_access_level      = "maintainer"
  merge_access_level     = "maintainer"
  unprotect_access_level = "maintainer"
  #allowed_to_push {
  #  group_id = gitlab_group.pub_grp.id
  #}
  #allowed_to_merge {
  #  group_id = gitlab_group.pub_grp.id
  #}
}