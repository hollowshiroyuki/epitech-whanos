provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "jenkins" {
  name = "whanos-jenkins"
  image = "ubuntu-20-04-x64"
  region = "fra1"
  size = "s-1vcpu-1gb"

  ssh_keys = [
    var.ssh_key_id
  ]
}

# data "digitalocean_kubernetes_versions" "k8s_versions" {}
# 
# resource "digitalocean_kubernetes_cluster" "k8" {
#   name = "whanos-k8"
#   region = "fra1"
#   version = data.digitalocean_kubernetes_versions.k8s_versions.latest_version
# 
#   node_pool {
#     name = "whanos-worker-pool"
#     size = "s-1vcpu-2gb"
#     node_count = 2
#   }
# }