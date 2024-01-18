<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | 16.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gitlab_init"></a> [gitlab\_init](#module\_gitlab\_init) | ./modules/gitlab_init | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deployment_exp_in"></a> [deployment\_exp\_in](#input\_deployment\_exp\_in) | A time span when the group deploy token expires in | `string` | `""` | no |
| <a name="input_gitlab_token"></a> [gitlab\_token](#input\_gitlab\_token) | GitLab server token | `string` | `""` | no |
| <a name="input_gitlab_url"></a> [gitlab\_url](#input\_gitlab\_url) | Base URL of the GitLab server | `string` | `""` | no |
| <a name="input_group_access_exp"></a> [group\_access\_exp](#input\_group\_access\_exp) | A time span when the group access token expires in | `string` | `""` | no |
| <a name="input_group_descr"></a> [group\_descr](#input\_group\_descr) | Group description | `string` | `""` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Group Name | `string` | `""` | no |
| <a name="input_group_path"></a> [group\_path](#input\_group\_path) | Group path - a part of the group URL | `string` | `""` | no |
| <a name="input_project_access_exp"></a> [project\_access\_exp](#input\_project\_access\_exp) | A time span when the project access token expires in | `string` | `""` | no |
| <a name="input_project_descr"></a> [project\_descr](#input\_project\_descr) | The Project description | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project Name | `string` | `""` | no |
| <a name="input_project_path"></a> [project\_path](#input\_project\_path) | The project path - a part of the project URL | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | Gitlab group name |
| <a name="output_group_url"></a> [group\_url](#output\_group\_url) | Gitlab group URL |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | Gitlab project name |
| <a name="output_project_url"></a> [project\_url](#output\_project\_url) | Gitlab project URL |
<!-- END_TF_DOCS -->