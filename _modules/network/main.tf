resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  resource_group_name = var.resource_group
  location = var.location
  address_space = var.vnet_cidrs
  dns_servers = var.dns_servers
}

resource "azurerm_subnet" "subnet" {
  depends_on = [azurerm_virtual_network.vnet]

  name = var.subnet_name
  resource_group_name = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.subnet_cidrs
}

// DEFINE PRIVATE DNS (maybe on another module ?)
//resource "azurerm_private_dns_zone" "private-dns" {
//  name = ""
//  resource_group_name = ""
//}
