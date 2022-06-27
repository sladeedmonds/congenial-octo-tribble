resource "random_string" "tf-storage-name" {
  length  = 23
  upper   = false
  special = false
}

resource "azurerm_resource_group" "rg-tf-state" {
  name     = "rg-tf-state"
  location = var.region_primary
}

resource "azurerm_storage_account" "tf-storage" {
  name                     = random_string.tf-storage-name.id
  resource_group_name      = azurerm_resource_group.rg-tf-state.name
  location                 = azurerm_resource_group.rg-tf-state.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    deployedBy = "Terraform"
  }
}