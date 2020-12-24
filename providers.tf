// ----------------------------------------------------------------------------
// Configure providers
// ----------------------------------------------------------------------------

provider "azurerm" {
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  features {}
}

//provider "helm" {
//  kubernetes {
//    host = module.cluster.cluster_endpoint
//    cluster_ca_certificate = base64decode(module.cluster.cluster_ca_certificate)
//    client_certificate = base64decode(module.cluster.client_certificate)
//    client_key = base64decode(module.cluster.client_key)
//  }
//}
