# ======================================================================================================================
# ========================================================= GLOBAL CONF ================================================
# ======================================================================================================================
variable resource_group_name {
  type = string
}
variable location {
  type = string
}
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}

# ======================================================================================================================
# ========================================================= AKS CONF ===================================================
# ======================================================================================================================
variable "kubernetes_version" {
  type = string
}
variable "ssh_public_key" {
  type = string
  default = "./id_rsa_back.pub"
}
variable "dns_prefix" {
  type = string
}
variable cluster_name {
  type = string
}
variable "enable_dashboard" {
  type = bool
}
variable "enable_ingress" {
  type = bool
  default = false
}
variable "subnet_id" {
  type = string
}

# DEFAULT NODE POOL CONF
variable "default_node_pool_type" {
  type = string
  default = "VirtualMachineScaleSets"
}
variable "default_node_pool_name" {
  type = string
}
variable "default_node_pool_vm_size" {
  type = string
}
variable "default_node_pool_node_count" {
  type = number
}
variable "default_node_pool_max_pods" {
  type = number
}
variable "default_node_pool_os_disk_size" {
  type = number
}

# ADDITIONAL NODE POOL CONFS
variable "additional_node_pools" {
  type = map(object({
    vm_size: string
    node_count: number
    max_pods: number
    os_disk_size: number
  }))
  default = {}
}
