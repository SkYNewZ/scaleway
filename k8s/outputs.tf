output "cluster_status" {
  value = scaleway_k8s_cluster_beta.cluster.status
}

output "cluster_apiserver_url" {
  value = scaleway_k8s_cluster_beta.cluster.apiserver_url
}

output "cluster_wildcard_dns" {
  value = scaleway_k8s_cluster_beta.cluster.wildcard_dns
}

output "cluster_kubeconfig" {
  value = scaleway_k8s_cluster_beta.cluster.kubeconfig.config_file
}

output "cluster_upgrade_available" {
  value = scaleway_k8s_cluster_beta.cluster.upgrade_available
}

output "cluster_nodes_count" {
  value = scaleway_k8s_pool_beta.default.size
}

output "cluster_nodes_ips" {
  value = {
    for i in scaleway_k8s_pool_beta.default.nodes : i.name => i.public_ip
  }
}
