resource "scaleway_instance_ip" "web" {
  count = var.instances_count
}

resource "scaleway_instance_server" "instance" {
  count             = var.instances_count
  type              = "DEV1-S"
  image             = "docker"
  security_group_id = scaleway_instance_security_group.web.id
  ip_id             = scaleway_instance_ip.web[count.index].id

  root_volume {
    size_in_gb            = 20
    delete_on_termination = true
  }

  connection {
    type        = "ssh"
    user        = "root"
    host        = self.public_ip
    private_key = file("/Users/quentin/.ssh/backup")
  }

  provisioner "remote-exec" {
    inline = [
      "docker run -d --rm -p 80:80 -p 443:443 --name traefik2 traefik/whoami",
    ]
  }
}
