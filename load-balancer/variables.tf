variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "project_id" {
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

variable "instances_count" {
  type        = number
  description = "# of instances to deploy"
  default     = "3"
}
