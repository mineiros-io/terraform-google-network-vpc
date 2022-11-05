resource "google_compute_network" "vpc" {
  count = var.module_enabled ? 1 : 0

  name        = var.name
  description = var.description
  project     = var.project

  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  mtu                             = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
  enable_ula_internal_ipv6        = var.enable_ula_internal_ipv6
  internal_ipv6_range             = var.internal_ipv6_range

  depends_on = [var.module_depends_on]
}
