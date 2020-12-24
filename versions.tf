terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    # helm = {
    #   version = "= 1.3.2"
    #   source  = "hashicorp/helm"
    # }
  }
  required_version = ">= 0.13"
}
