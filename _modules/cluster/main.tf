provider "helm" {
  kubernetes {
    host = azurerm_kubernetes_cluster.aks.kube_config.0.host
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
    client_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
    client_key = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
  }
}

# DEFINE AKS CLUSTER
resource "azurerm_kubernetes_cluster" "aks" {
  // @TODO add autoscaling conf

  service_principal {
    client_id = var.client_id
    client_secret = var.client_secret
  }

  name = var.cluster_name
  location = var.location
  resource_group_name = var.resource_group_name
  kubernetes_version = var.kubernetes_version
  dns_prefix = var.dns_prefix

  # ENABLE DASHBOARD
  addon_profile {
    kube_dashboard {
      enabled = var.enable_dashboard
    }
  }

  # ALLOW SSH ACCESS FOR A GIVEN SSH KEY
  linux_profile {
    admin_username = "reezocar"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  # DISABLE RBAC
  role_based_access_control {
    enabled = false
  }

  # DEFINE NETWORK ACCESS
  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.10.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    service_cidr = "10.10.0.0/16"
  }

  # CONFIGURE NODE POOLS
  default_node_pool {
    type = var.default_node_pool_type
    name = var.default_node_pool_name
    vm_size = var.default_node_pool_vm_size
    node_count = var.default_node_pool_node_count
    max_pods = var.default_node_pool_max_pods
    os_disk_size_gb = var.default_node_pool_os_disk_size
    vnet_subnet_id = var.subnet_id
  }

//  tags = {
//    environment = "Development"
//  }
}

# DEFINE ADDITIONAL NODE POOLS
resource "azurerm_kubernetes_cluster_node_pool" "additional-node-pools" {
  for_each = var.additional_node_pools

  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vnet_subnet_id = var.subnet_id

  name = each.key
  vm_size = each.value.vm_size
  node_count = each.value.node_count
  max_pods = each.value.max_pods
  os_disk_size_gb = each.value.os_disk_size

  tags = {
    environment = "Development"
  }
}

// ----------------------------------------------------------------------------
// Install nginx ingress-controller
// ----------------------------------------------------------------------------

// DEFINE NGINX HELM REPO
data "helm_repository" "ingress-controller" {
  count = var.enable_ingress ? 1 : 0
  name = "ingress-nginx"
  url = "https://kubernetes.github.io/ingress-nginx"
}
// CREATE K8S INGRESS WITH EXTERNAL IP
resource "helm_release" "ingress-controller" {
  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]

  count = var.enable_ingress ? 1 : 0

  wait = true
  timeout = 900
  cleanup_on_fail = true
  dependency_update = true

  chart = "ingress-nginx/ingress-nginx"
  name = "ingress-nginx"
  namespace = "kube-system"

  set {
    name = "rbac.create"
    value = false
  }
  # Add an additional internal load-balancer
  set {
    name = "controller.service.internal.enabled"
    value = true
  }
  # Setup an additional azure load balancer for the internal ingress
  set {
    name = "controller.service.internal.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal"
    value = "true"
  }
}
