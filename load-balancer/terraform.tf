provider "scaleway" {
  access_key      = var.access_key
  secret_key      = var.secret_key
  organization_id = var.project_id # https://github.com/scaleway/terraform-provider-scaleway/issues/534
  region          = var.region
  zone            = var.zone
}
