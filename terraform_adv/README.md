<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.5.0)

- <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) (16.1.0)

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_gitlab_init"></a> [gitlab\_init](#module\_gitlab\_init)

Source: ./modules/gitlab_init

Version:

## Resources

No resources.

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_deployment_exp_in"></a> [deployment\_exp\_in](#input\_deployment\_exp\_in)

Description: A time span when the group deploy token expires in

Type: `string`

Default: `""`

### <a name="input_gitlab_token"></a> [gitlab\_token](#input\_gitlab\_token)

Description: GitLab server token

Type: `string`

Default: `""`

### <a name="input_gitlab_url"></a> [gitlab\_url](#input\_gitlab\_url)

Description: Base URL of the GitLab server

Type: `string`

Default: `""`

### <a name="input_group_access_exp"></a> [group\_access\_exp](#input\_group\_access\_exp)

Description: A time span when the group access token expires in

Type: `string`

Default: `""`

### <a name="input_group_descr"></a> [group\_descr](#input\_group\_descr)

Description: Group description

Type: `string`

Default: `""`

### <a name="input_group_name"></a> [group\_name](#input\_group\_name)

Description: Group Name

Type: `string`

Default: `""`

### <a name="input_group_path"></a> [group\_path](#input\_group\_path)

Description: Group path - a part of the group URL

Type: `string`

Default: `""`

### <a name="input_project_access_exp"></a> [project\_access\_exp](#input\_project\_access\_exp)

Description: A time span when the project access token expires in

Type: `string`

Default: `""`

### <a name="input_project_descr"></a> [project\_descr](#input\_project\_descr)

Description: The Project description

Type: `string`

Default: `""`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: The project Name

Type: `string`

Default: `""`

### <a name="input_project_path"></a> [project\_path](#input\_project\_path)

Description: The project path - a part of the project URL

Type: `string`

Default: `""`

## Outputs

The following outputs are exported:

### <a name="output_group_name"></a> [group\_name](#output\_group\_name)

Description: Gitlab group name

### <a name="output_group_url"></a> [group\_url](#output\_group\_url)

Description: Gitlab group URL

### <a name="output_project_name"></a> [project\_name](#output\_project\_name)

Description: Gitlab project name

### <a name="output_project_url"></a> [project\_url](#output\_project\_url)

Description: Gitlab project URL
<!-- END_TF_DOCS -->