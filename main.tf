provider "azurerm" {
  features {}

  subscription_id = "7570f573-0987-4280-83eb-aaaf101738a4"
  client_id       = "7fa8bf95-1996-4fbc-a63d-7c8058b0b569"
  client_secret   = "Shz8Q~e-p_gvz2OJVhhu7ngaikwOg9qvAwuLUaL-"
  tenant_id       = "9e2aa9e5-8b72-430b-b9f2-14e22baee0e2"
}

resource "azurerm_resource_group" "rg" {
  name     = var.azurerm_resource_group-name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network-name
  address_space       = var.address_space 
  location            = var.location
  resource_group_name = var.azurerm_resource_group-name
  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "azurerm_subnet" "subnet01" {
  name                 = var.azurerm_subnet01
  resource_group_name  = var.azurerm_resource_group-name
  virtual_network_name = var.azurerm_virtual_network-name
  address_prefixes     = var.address_prefixes01
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet" "subnet02" {
  name                 = var.azurerm_subnet02
  resource_group_name  = var.azurerm_resource_group-name
  virtual_network_name = var.azurerm_virtual_network-name
  address_prefixes     = var.address_prefixes02
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet" "subnet03" {
  name                 = var.azurerm_subnet03
  resource_group_name  = var.azurerm_resource_group-name
  virtual_network_name = var.azurerm_virtual_network-name
  address_prefixes     = var.address_prefixes03
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.azurerm_network_security_group-nsg
  location            = var.location
  resource_group_name = var.azurerm_resource_group-name

  security_rule {
    name                       = var.name
    priority                   = var.priority
    direction                  = var.direction
    access                     = var.access
    protocol                   = var.protocol
    source_port_range          = var.source_port_range
    destination_port_range     = var.destination_port_range
    source_address_prefix      = var.source_address_prefix
    destination_address_prefix = var.destination_address_prefix
  }
  depends_on = [
    azurerm_resource_group.rg
  ]


}
