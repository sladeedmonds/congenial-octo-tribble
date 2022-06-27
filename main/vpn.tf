resource "azurerm_vpn_gateway" "vpngw_default" {
  name = "vpngw-${var.environment}"
  location = azurerm_resource_group.rg-networking.location
  resource_group_name = azurerm_resource_group.rg-networking.name
}