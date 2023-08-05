output "grp_id" {
  value       = gitlab_group.pub_grp.id
  sensitive   = false
  description = "Gitlab Group ID"
}

output "grp_name" {
  value       = gitlab_group.pub_grp.name
  sensitive   = false
  description = "Gitlab group name"
}

output "grp_url" {
  value       = gitlab_group.pub_grp.web_url
  sensitive   = false
  description = "Gitlab group URL"
}

output "proj_id" {
  value       = gitlab_project.proj.id
  sensitive   = false
  description = "Gitlab project ID"
}

output "proj_name" {
  value       = gitlab_project.proj.name
  sensitive   = false
  description = "Gitlab project name"
}

output "proj_url" {
  value       = gitlab_project.proj.web_url
  sensitive   = false
  description = "Gitlab project URL"
}

output "grp_token" {
  value       = gitlab_group_access_token.grp_token_dev.id
  sensitive   = false
  description = "Group access token id"
}

output "proj_token" {
  value       = gitlab_project_access_token.proj_token_dev.id
  sensitive   = false
  description = "Project token id"
}

output "dpl_token" {
  value       = gitlab_deploy_token.grp_token_dpl.id
  sensitive   = false
  description = "Group deployment token id"
}