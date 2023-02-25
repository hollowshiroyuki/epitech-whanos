# This file *defines* the terraform variables, it MUSTN'T be added to your
# version control.

# Digital Ocean API Token (Needs R/W Permissions)
# https://cloud.digitalocean.com/account/api/tokens
do_token = "dop_v1_xxxxxxx..."

# Digital Ocean Project
# All the resources will be created in this project
# https://cloud.digitalocean.com/projects/
do_project = "first-project"

# SSH Key ID
# This key will be pushed on every deployed machine for Ansible to connect
# https://cloud.digitalocean.com/account/security
do_ssh_key_id = "xx:xx:xx:xx:..."

## The variables below are here for reference,
## you shouldn't have to use them in normal operation.

# Project Domain
# The main domain of the project
# domain = "yobwhamos.cloud"

# Jenkins Domain
# The jenkins subdomain
# jenkins_domain = "jenkins"

# Registry Domain
# The docker registry subdomain
# registry_domain = "registry"