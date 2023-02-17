output "jenkins" {
  value = digitalocean_droplet.jenkins
}

# output "k8" {
#   sensitive = true
#   value = digitalocean_kubernetes_cluster.k8
# }