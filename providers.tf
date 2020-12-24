// ----------------------------------------------------------------------------
// Configure providers
// ----------------------------------------------------------------------------

provider "azurerm" {
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
