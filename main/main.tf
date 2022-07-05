terraform {

  required_version = "=1.2.4"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.12.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
  }

}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}
