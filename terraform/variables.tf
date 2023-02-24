# This file *declares* the available terraform variables
# To actually *define* them create a "terraform.tfvars" file here
# and fill-in all the variables.

# Digital Ocean API Token (Needs R/W Permissions)
# https://cloud.digitalocean.com/account/api/tokens
variable "do_token" {
  type = string
}

# Digital Ocean Project
# https://cloud.digitalocean.com/projects/
variable do_project {
  type = string
}

# SSH Key ID
# This key will be pushed on every deployed machine for Ansible to connect
# https://cloud.digitalocean.com/account/security
variable "do_ssh_key_id" {
  type = string
}

# Project Domain
# The main domain of the project
variable "domain" {
  type = string
}

# Jenkins Domain
# The jenkins subdomain
variable "jenkins_domain" {
  type = string
}

# Registry Domain
# The docker registry domain
variable "registry_domain" {
  type = string
}