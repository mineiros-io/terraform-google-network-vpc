module "test" {
  source = "../.."

  project                         = local.project_id
  name                            = "vpc-unit-complete"
  description                     = "This is a unit test"
  routing_mode                    = "GLOBAL"
  delete_default_routes_on_create = true
  auto_create_subnetworks         = true
  mtu                             = 1500
  enable_ula_internal_ipv6        = true
  internal_ipv6_range             = "fd20:fff:ffff:ffff:ffff:ffff:ffff:ffff"
}
