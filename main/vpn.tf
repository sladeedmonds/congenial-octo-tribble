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

resource "azurerm_local_network_gateway" "lng_home" {
  name = "local-gateway-home-${var.environment}"
  location = azurerm_resource_group.rg-networking.location
  resource_group_name = azurerm_resource_group.rg-networking.name
  gateway_address = var.slade_home_ip
  address_space = ["${var.slade_home_network}"]
}

resource "azurerm_virtual_network_gateway_connection" "vng_connection_home" {
  name = "onprem"
  location = azurerm_resource_group.rg-networking.location
  resource_group_name = azurerm_resource_group.rg-networking.name

  type = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vnetgw_default.id
  local_network_gateway_id = azurerm_local_network_gateway.lng_home.id

  shared_key = var.psk_sandbox
}