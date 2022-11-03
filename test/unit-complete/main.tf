module "test" {
  source = "../.."

  project                         = local.project_id
  name                            = "vpc-unit-complete"
  description                     = "This is a unit test"
  routing_mode                    = "GLOBAL"
  delete_default_routes_on_create = true
  auto_create_subnetworks         = true
  mtu                             = 1500
}
