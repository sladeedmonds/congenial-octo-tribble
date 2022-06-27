resource "azurerm_public_ip" "pip_vnetgw" {
  name = "pip-vnetgw-sandbox"
  resource_group_name = azurerm_resource_group.rg-networking.name
  location = azurerm_resource_group.rg-networking.location
  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "vnetgw_default" {
  name = "vnetgw-${var.environment}"
  location = azurerm_resource_group.rg-networking.location
  resource_group_name = azurerm_resource_group.rg-networking.name

  type = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp = false
  sku = "VpnGw1"

  ip_configuration {
	name = "vnetGatewayConfig"
	public_ip_address_id = azurerm_public_ip.pip_vnetgw.id
	private_ip_address_allocation = "Dynamic"
	subnet_id = azurerm_subnet.subnet-vnetgw.id
  }
}