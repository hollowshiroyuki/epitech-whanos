output "jenkins" {
  value = digitalocean_droplet.jenkins
}

output "registry" {
  value = digitalocean_droplet.registry
}

# output "k8" {
#   sensitive = true
#   value = digitalocean_kubernetes_cluster.k8
# }