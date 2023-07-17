output "Group_Name" {
  value       = gitlab_group.gr1.name
  sensitive   = false
  description = "Gitlab group name"
}

output "Group_URL" {
  value       = gitlab_group.gr1.web_url
  sensitive   = false
  description = "Gitlab group URL"
}


output "Project_Name" {
  value       = gitlab_project.pr1.name
  sensitive   = false
  description = "Gitlab project name"
}

output "Project_URL" {
  value       = gitlab_project.pr1.web_url
  sensitive   = false
  description = "Gitlab project URL"
}


