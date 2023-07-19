## GitLab provider  vars #########################################
variable "gitlab_url" {
  type        = string
  default     = ""
  description = "Base URL of the GitLab server"
}

variable "gitlab_token" {
  type        = string
  default     = ""
  description = "GitLab server token"
}

## Group vars ################################################
variable "group_name" {
  description = "Group Name"
  type        = string
  default     = ""
}

variable "group_descr" {
  description = "Group description"
  type        = string
  default     = ""
}

variable "group_path" {
  description = "Group path - a part of the group URL"
  type        = string
  default     = ""
}

## Project variables ########################################
variable "project_name" {
  description = "The project Name"
  type        = string
  default     = ""
}

variable "project_descr" {
  description = "The Project description"
  type        = string
  default     = ""
}

variable "project_path" {
  description = "The project path - a part of the project URL"
  type        = string
  default     = ""
}

## Access tockens variables ###########################################
variable "project_access_exp" {
  description = "A time span when the project access token expires in"
  type        = string
  default     = ""
}

variable "deployment_exp_in" {
  description = "A time span when the group deploy token expires in"
  type        = string
  default     = ""
}

variable "group_access_exp" {
  description = "A time span when the group access token expires in"
  type        = string
  default     = ""
}