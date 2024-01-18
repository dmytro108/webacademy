<!-- BEGIN_TF_DOCS -->


## Example

```hcl
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
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dpl_exp_in"></a> [dpl\_exp\_in](#input\_dpl\_exp\_in) | A time span when the group deploy token expires in | `string` | `""` | no |
| <a name="input_gitlab_api_token"></a> [gitlab\_api\_token](#input\_gitlab\_api\_token) | GitLab server token | `string` | `""` | no |
| <a name="input_gitlab_base_url"></a> [gitlab\_base\_url](#input\_gitlab\_base\_url) | Base URL of the GitLab server | `string` | `""` | no |
| <a name="input_grp_descr"></a> [grp\_descr](#input\_grp\_descr) | Group description | `string` | `""` | no |
| <a name="input_grp_name"></a> [grp\_name](#input\_grp\_name) | Group Name | `string` | `""` | no |
| <a name="input_grp_path"></a> [grp\_path](#input\_grp\_path) | Group path - a part of the group URL | `string` | `""` | no |
| <a name="input_grp_token_exp"></a> [grp\_token\_exp](#input\_grp\_token\_exp) | The tocken experation date | `string` | `""` | no |
| <a name="input_proj_descr"></a> [proj\_descr](#input\_proj\_descr) | The Project description | `string` | `""` | no |
| <a name="input_proj_name"></a> [proj\_name](#input\_proj\_name) | The project Name | `string` | `""` | no |
| <a name="input_proj_path"></a> [proj\_path](#input\_proj\_path) | The project path - a part of the project URL | `string` | `""` | no |
| <a name="input_proj_token_exp"></a> [proj\_token\_exp](#input\_proj\_token\_exp) | The tocken experation date | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dpl_token"></a> [dpl\_token](#output\_dpl\_token) | Group deployment token id |
| <a name="output_grp_id"></a> [grp\_id](#output\_grp\_id) | Gitlab Group ID |
| <a name="output_grp_name"></a> [grp\_name](#output\_grp\_name) | Gitlab group name |
| <a name="output_grp_token"></a> [grp\_token](#output\_grp\_token) | Group access token id |
| <a name="output_grp_url"></a> [grp\_url](#output\_grp\_url) | Gitlab group URL |
| <a name="output_proj_id"></a> [proj\_id](#output\_proj\_id) | Gitlab project ID |
| <a name="output_proj_name"></a> [proj\_name](#output\_proj\_name) | Gitlab project name |
| <a name="output_proj_token"></a> [proj\_token](#output\_proj\_token) | Project token id |
| <a name="output_proj_url"></a> [proj\_url](#output\_proj\_url) | Gitlab project URL |
<!-- END_TF_DOCS -->