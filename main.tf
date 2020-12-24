// ----------------------------------------------------------------------------
// Azure AKS Cluster
// ----------------------------------------------------------------------------
module "cluster" {
  source = "./_modules/cluster"

  client_id           = var.client_id
  client_secret       = var.client_secret
  location            = var.resources_location
  cluster_name        = var.cluster_name
  resource_group_name = var.resource_group

  subnet_id  = data.azurerm_subnet.subnet.id
  dns_prefix = var.cluster_name

  default_node_pool_name = var.cluster_default_node_pool_name

  additional_node_pools = var.cluster_additional_node_pools

  enable_dashboard = var.enable_dashboard
}
