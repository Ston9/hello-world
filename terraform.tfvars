resources_location = "North Europe"
resource_group     = "RG_UAT_BACK"

// @FIXME for now we can't create our own vnet and subnet so we use the existing one
//vnet_resource_group = "RG_INFRA"
//vnet_name = "VNET_INFRA_REEZOCAR"

//vnet_name = "VNET-UAT-BACK-001"
//vnet_cidrs = [
//  "10.1.0.0/16",
//  //@TODO add others ?
//]

//subnet_name = "SUBNET-UAT-BACK-001"
//subnet_cidrs = ["10.1.32.0/20"]
subnet_name = "SUB_UAT_AKS_BACK"

cluster_name = "K8S-BACK-UAT-TFC"
// @FIXME update app k8s definitions and use latest cluster version
cluster_kubernetes_version           = "1.18.8"
cluster_default_node_pool_vm_size    = "Standard_B2s"
cluster_default_node_pool_node_count = 1
cluster_default_node_pool_disk_size  = 30
cluster_default_node_pool_max_pods   = 50
cluster_default_node_pool_name       = "spiders"
cluster_additional_node_pools = {
  microservice : {
    vm_size : "Standard_B2s"
    node_count : 1
    max_pods : 50
    os_disk_size : 30
  }
}

enable_dashboard = true
