resource "scaleway_instance_security_group" "web" {
  inbound_default_policy  = "drop" # By default we drop incomming trafic that do not match any inbound_rule
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = 80
  }

  inbound_rule {
    action = "accept"
    port   = 443
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = "92.148.99.2"
  }
}
