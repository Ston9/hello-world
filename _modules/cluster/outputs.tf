output "fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}
output "cluster_endpoint" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.host
}
output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}
output "client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
}
output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate
}
output "cluster_config_merge_help" {
  value = "az aks get-credentials -a --resource-group ${var.resource_group_name} --name ${var.cluster_name}"
}
