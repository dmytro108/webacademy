output "group_name" {
  value       = module.gitlab_init.grp_name
  sensitive   = false
  description = "Gitlab group name"
}

output "group_url" {
  value       = module.gitlab_init.grp_url
  sensitive   = false
  description = "Gitlab group URL"
}


output "project_name" {
  value       = module.gitlab_init.proj_name
  sensitive   = false
  description = "Gitlab project name"
}

output "project_url" {
  value       = module.gitlab_init.proj_url
  sensitive   = false
  description = "Gitlab project URL"
}

