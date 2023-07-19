gitlab_url = "http://gitlab.example.com:8888/api/v4/"
## Gitlab token should be passed to > terraform plan -var gitlab_token=$GITLAB_API_TOKEN

group_name  = "Mega"
group_path  = "mega"
group_descr = "New Mega project"

project_name  = "Mega Sources"
project_path  = "mega_src"
project_descr = "Mega repositary"

group_access_exp   = "2023-08-01"
project_access_exp = "2023-08-01"
deployment_exp_in  = "24h"