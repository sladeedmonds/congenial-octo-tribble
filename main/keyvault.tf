resource "random_pet" "kv" {
  prefix = var.kv_prefix
}

resource "azurerm_resource_group" "rg-keyvault" {
  name     = "rg-keyvault-${var.environment}"
  location = var.region_primary
}

resource "azurerm_key_vault" "kv-sandbox" {
  name                = random_pet.kv.id
  location            = azurerm_resource_group.rg-keyvault.location
  resource_group_name = azurerm_resource_group.rg-keyvault.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}
