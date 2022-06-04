resource "azurerm_network_security_group" "nsg-bastion" {
  name                = "nsg-bastion"
  location            = azurerm_resource_group.rg-networking.location
  resource_group_name = azurerm_resource_group.rg-networking.name

  security_rule {
    name                       = "AllowSladeHomeHttps"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "172.125.57.122"
    destination_address_prefix = "*"
  }

security_rule {
    name                       = "AllowGatewayManager"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "GatewayManager"
    destination_address_prefix = "*"
  }

security_rule {
    name                       = "AllowDataplane"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = [8080, 5071]
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  tags = {
    createdBy = "Terraform"
  }
}
