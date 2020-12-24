# ======================================================================================================================
# ========================================================= AZURE CONF =================================================
# ======================================================================================================================
# variable "client_id" {
#   type = string
# }
# variable "client_secret" {
#   type = string
# }
# variable "subscription_id" {
#   type = string
# }
# variable "tenant_id" {
#   type = string
# }
# variable "state_access_key" {
#   description = "access key for Azure backend storage account state"
#   type        = string
#   default     = ""
# }

# ======================================================================================================================
# ========================================================= AZURE CONF =================================================
# ======================================================================================================================
variable "client_id" {
  type    = string
  default = ""
}
variable "client_secret" {
  type    = string
  default = ""
}
variable "subscription_id" {
  type    = string
  default = ""
}
variable "tenant_id" {
  type    = string
  default = ""
}
variable "resources_location" {
  description = "where should all resources be created ?"
  type        = string
  default     = "North Europe"
}
variable "resource_group" {
  type = string
}

# ======================================================================================================================
# ========================================================= CLUSTER CONF ===============================================
# ======================================================================================================================
variable "cluster_kubernetes_version" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "cluster_default_node_pool_name" {
  type = string
}
variable "cluster_default_node_pool_node_count" {
  type = number
}
variable "cluster_default_node_pool_vm_size" {
  type = string
}
variable "cluster_default_node_pool_disk_size" {
  type = number
}
variable "cluster_default_node_pool_max_pods" {
  type = number
}
variable "cluster_additional_node_pools" {
  type = map(object({
    vm_size : string
    node_count : number
    max_pods : number
    os_disk_size : number
  }))
  default = {}
}
variable "enable_dashboard" {
  type = bool
}
variable "enable_ingress" {
  type    = bool
  default = false
}

# ======================================================================================================================
# ========================================================= NETWORK CONF ===============================================
# ======================================================================================================================
//variable "vnet_resource_group" {
//  type = string
//}
//variable "vnet_name" {
//  type = string
//}
//variable "vnet_cidrs" {
//  type = list(string)
//}
//variable "vnet_dns_servers" {
//  type = list(string)
//  // @TODO use azure private DNS
//  default = [
//    "10.1.10.4",
//    "10.1.10.7"
//  ]
//}
//
variable "subnet_name" {
  type = string
}
//variable "subnet_cidrs" {
//  type = list(string)
//}
//variable "dns_prefix" {
//  type = string
//  default = var.cluster_name
//}
