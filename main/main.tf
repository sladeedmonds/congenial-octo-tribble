terraform {

  required_version = "=1.2.3"
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.5.0"
    }
  }

  backend "azurerm" {
    resource_group_name = ""
    storage_account_name = ""
    container_name = ""
    key = ""
  }
  
}

provider "azurerm" {
  features {}
} 

data "azurerm_client_config" "current" {}

resource "random_pet" "aks" {
  prefix    = var.aks_prefix
}

resource "azurerm_resource_group" "rg-aks" {
  name      = "rg-aks"
  location  = var.resource_group_location
}
