output "cluster_fqdn" {
  value = module.cluster.fqdn
}
output "cluster_name" {
  value = var.cluster_name
}
output "cluster_config_help" {
  value = module.cluster.cluster_config_merge_help
}
