variable "gitlab_url" {
  type        = string
  default     = "http://gitlab.example.com:8888/api/v4/"
  description = "Base URL of the GitLab server"
}
variable "gitlab_token" {
  type        = string
  default     = "glpat-JuMsHYLk99BGautkUFVY"
  description = "GitLab server token"
}

variable "pr_token_exp" {
  type        = string
  default     = "2023-08-01"
  description = "Time the token will expire it, YYYY-MM-DD format"
}

