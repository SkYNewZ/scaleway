output "instances_ip" {
  value = {
    for instance in scaleway_instance_server.instance : instance.name => instance.public_ip
  }
}

output "lb_ip" {
  value = scaleway_lb_beta.base.ip_address
}
