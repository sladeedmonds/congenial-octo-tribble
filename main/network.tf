resource "azurerm_resource_group" "rg-networking" {
  name     = "rg-networking-sandbox"
  location = "eastus"
}

resource "azurerm_network_security_group" "nsg-default" {
  name                = "nsg-default"
  location            = azurerm_resource_group.rg-networking.location
  resource_group_name = azurerm_resource_group.rg-networking.name
}

resource "azurerm_virtual_network" "vnet-default" {
  name                = "vnet-sandbox"
  location            = azurerm_resource_group.rg-networking.location
  resource_group_name = azurerm_resource_group.rg-networking.name
  address_space       = ["10.10.0.0/16"]

}

resource "azurerm_public_ip" "vip-bastion" {
  name                = "vip-bastion-sandbox"
  location            = azurerm_resource_group.rg-networking.location
  resource_group_name = azurerm_resource_group.rg-networking.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_subnet" "subnet-default" {
  name                 = "DefaultSubnet"
  virtual_network_name = azurerm_virtual_network.vnet-default.name
  resource_group_name  = azurerm_resource_group.rg-networking.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_subnet" "subnet-aks" {
  name                 = "AKSSubnet"
  virtual_network_name = azurerm_virtual_network.vnet-default.name
  resource_group_name  = azurerm_resource_group.rg-networking.name
  address_prefixes     = ["10.10.2.0/24"]
}

resource "azurerm_subnet" "subnet-bastion" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = azurerm_virtual_network.vnet-default.name
  resource_group_name  = azurerm_resource_group.rg-networking.name
  address_prefixes     = ["10.10.254.0/27"]
}
