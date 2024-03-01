resource "azurerm_resource_group" "rg-kelly-flores" {
  location = "Central US"
  name     = "rg-kelly-flores"
}

resource "azurerm_container_registry" "kellyflores" {
  name                = "kellyflores"
  location            = azurerm_resource_group.rg-kelly-flores.location
  resource_group_name = azurerm_resource_group.rg-kelly-flores.name
  sku                 = "Standard"
}