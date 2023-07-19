## Group variables ##########################################
variable "grp_name" {
  description = "Group Name"
  type        = string
  default     = ""
}

variable "grp_descr" {
  description = "Group description"
  type        = string
  default     = ""
}

variable "grp_path" {
  description = "Group path - a part of the group URL"
  type        = string
  default     = ""
}

## Project variables ########################################
variable "proj_name" {
  description = "The project Name"
  type        = string
  default     = ""
}

variable "proj_descr" {
  description = "The Project description"
  type        = string
  default     = ""
}

variable "proj_path" {
  description = "The project path - a part of the project URL"
  type        = string
  default     = ""
}

## Access tockens variables ###########################################
variable "proj_token_exp" {
  description = "The tocken experation date"
  type        = string
  default     = ""
}

variable "dpl_exp_in" {
  description = "A time span when the group deploy token expires in"
  type        = string
  default     = ""
}

variable "grp_token_exp" {
  description = "The tocken experation date"
  type        = string
  default     = ""
}

###############################################
## GitLab provider  vars #########################################
variable "gitlab_base_url" {
  type        = string
  default     = ""
  description = "Base URL of the GitLab server"
}

variable "gitlab_api_token" {
  type        = string
  default     = ""
  description = "GitLab server token"
}
