variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "organization_id" {
  type = string
}

variable "region" {
  type    = string
  default = "fr-par"
}

variable "zone" {
  type    = string
  default = "fr-par-1"
}

variable "cluster_name" {
  type    = string
  default = "k8s-gallant-jepsen"
}
