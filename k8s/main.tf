resource "scaleway_k8s_cluster_beta" "cluster" {
  name             = var.cluster_name
  description      = "Kubernetes cluster to learn it"
  version          = "1.19"
  cni              = "cilium"
  enable_dashboard = true
  ingress          = "traefik"

  autoscaler_config {
    disable_scale_down         = false
    scale_down_delay_after_add = "5m"
    scale_down_unneeded_time   = "5m"
  }

  auto_upgrade {
    enable                        = true
    maintenance_window_start_hour = 2
    maintenance_window_day        = "sunday"
  }
}

resource "scaleway_k8s_pool_beta" "default" {
  cluster_id          = scaleway_k8s_cluster_beta.cluster.id
  name                = "default"
  node_type           = "DV1-M"
  size                = 2
  wait_for_pool_ready = true
}
