# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# These variables must be set when using this module.
# ---------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# These variables have defaults, but may be overridden.
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  description = "(Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used."
  type        = string
  default     = null
}

variable "name" {
  description = "(Optional) The name of the VPC. The name will be used to prefix all associacted resources also. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression \"[a-z]([-a-z0-9]*[a-z0-9])?\" which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. Default is \"main\"."
  type        = string
  default     = "main"

  validation {
    condition     = can(regex("[a-z]([-a-z0-9]*[a-z0-9])?", var.name)) && length(var.name) >= 1 && length(var.name) <= 64
    error_message = "The name must be 1-63 characters long and match the regular expression \"[a-z]([-a-z0-9]*[a-z0-9])?\" which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash."
  }
}

variable "description" {
  description = "(Optional) An optional description of the VPC. The resource must be recreated to modify this field.Default is ''."
  type        = string
  default     = ""
}

variable "routing_mode" {
  description = "(Optional) The network-wide routing mode to use. If set to 'REGIONAL', this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to 'GLOBAL', this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are 'REGIONAL' and 'GLOBAL'. Default is 'REGIONAL'."
  type        = string
  default     = "REGIONAL"

  validation {
    condition     = var.routing_mode != "REGIONAL" || var.routing_mode != "GLOBAL"
    error_message = "The vpc_routing_mode must be set to either 'REGIONAL' or 'GLOBAL'."
  }
}

variable "delete_default_routes_on_create" {
  description = "(Optional) If set to true, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted."
  type        = bool
  default     = false
}

variable "auto_create_subnetworks" {
  description = "(Optional) When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the '10.128.0.0/9' address range. When set to 'false', the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. Default is 'false'."
  type        = bool
  default     = false
}

variable "network_firewall_policy_enforcement_order" {
  description = "(Optional) Set the order that Firewall Rules and Firewall Policies are evaluated. Default value is AFTER_CLASSIC_FIREWALL. Possible values are: BEFORE_CLASSIC_FIREWALL, AFTER_CLASSIC_FIREWALL."
  type        = string
  default     = null
}

variable "mtu" {
  description = "(Optional) Maximum Transmission Unit in bytes. The minimum value for this field is 1460 and the maximum value is 1500 bytes. Default is '1460'."
  type        = string
  default     = 1460

  validation {
    condition     = var.mtu >= 1460 && var.mtu <= 1500
    error_message = "The mtu expects a value between '1460' and '1500'."
  }
}

variable "enable_ula_internal_ipv6" {
  description = "(Optional) Enable ULA internal ipv6 on this network. Enabling this feature will assign a /48 from google defined ULA prefix fd20::/20."
  type        = bool
  default     = false
}

variable "internal_ipv6_range" {
  description = "(Optional) When enabling ula internal ipv6, caller optionally can specify the /48 range they want from the google defined ULA prefix fd20::/20. The input must be a valid /48 ULA IPv6 address and must be within the fd20::/20. Operation will fail if the speficied /48 is already in used by another resource. If the field is not speficied, then a /48 range will be randomly allocated from fd20::/20 and returned via this field."
  type        = string
  default     = null
}

# ------------------------------------------------------------------------------
# MODULE CONFIGURATION PARAMETERS
# These variables are used to configure the module.
# ------------------------------------------------------------------------------

variable "module_enabled" {
  description = "(Optional) Whether to create resources within the module or not. Default is 'true'."
  type        = bool
  default     = true
}

variable "module_depends_on" {
  description = "(Optional) A list of external resources the module depends_on. Default is '[]'."
  type        = any
  default     = []
}
