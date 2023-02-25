provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_project" "project" {
  name = var.do_project
}

data "digitalocean_domain" "domain" {
  name = var.domain
}

# Jenkins
resource "digitalocean_droplet" "jenkins" {
  name = "jenkins"
  image = "ubuntu-22-10-x64"
  region = "fra1"
  size = "s-1vcpu-1gb"

  ssh_keys = [
    var.do_ssh_key_id
  ]
}

resource "digitalocean_record" "jenkins_record" {
  name = var.jenkins_domain
  domain = data.digitalocean_domain.domain.id
  type = "A"
  value = digitalocean_droplet.jenkins.ipv4_address
  ttl = 60
}

# Registry
resource "digitalocean_droplet" "registry" {
  name = "registry"
  image = "ubuntu-22-10-x64"
  region = "fra1"
  size = "s-1vcpu-1gb"

  ssh_keys = [
    var.do_ssh_key_id
  ]
}

resource "digitalocean_record" "registry_record" {
  name = var.registry_domain
  domain = data.digitalocean_domain.domain.id
  type = "A"
  value = digitalocean_droplet.registry.ipv4_address
  ttl = 60
}

data "digitalocean_kubernetes_versions" "k8s_versions" {}

resource "digitalocean_kubernetes_cluster" "k8" {
  name = "k8"
  region = "fra1"
  version = data.digitalocean_kubernetes_versions.k8s_versions.latest_version

  node_pool {
    name = "k8-workers"
    size = "s-1vcpu-2gb"
    node_count = 2
  }
}

# Resources
resource "digitalocean_project_resources" "project_resources" {
  project = data.digitalocean_project.project.id
  resources = [
    digitalocean_droplet.jenkins.urn,
    digitalocean_droplet.registry.urn,
    digitalocean_kubernetes_cluster.k8.urn
  ]
}