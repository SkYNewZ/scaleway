resource "scaleway_lb_ip_beta" "ip" {}

resource "scaleway_lb_beta" "base" {
  ip_id = scaleway_lb_ip_beta.ip.id
  type  = "LB-S"
}

resource "scaleway_lb_backend_beta" "backend01" {
  lb_id            = scaleway_lb_beta.base.id
  forward_protocol = "http"
  forward_port     = "80"

  health_check_http {
    uri    = "/health"
    method = "GET"
    code   = 200
  }

  server_ips = scaleway_instance_server.instance.*.public_ip
}

resource "scaleway_lb_frontend_beta" "frontend01" {
  lb_id        = scaleway_lb_beta.base.id
  backend_id   = scaleway_lb_backend_beta.backend01.id
  name         = "frontend01"
  inbound_port = "80"
}
