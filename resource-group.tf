// ----------------------------------------------------------------------------
// Setup Azure Resource Groups
// ----------------------------------------------------------------------------

resource "azurerm_resource_group" "network" {
  name     = "test-rg-agaillet-tc"
  location = var.resources_location
}

//
//resource "azurerm_resource_group" "cluster" {
//  name = var.cluster_resource_group
//  location = var.resources_location
//}
//resource "azurerm_resource_group" "dns" {
//  count = var.external_dns_enabled ? 1 : 0
//  name = var.dns_resource_group
//  location = var.resources_location
//}
