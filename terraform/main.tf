resource "azurerm_resource_group" "main" {
  name     = "minecraft-server"
  location = "eastus"
}

resource "azurerm_container_registry" "main" {
  name                = "minecraftserver"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Basic"
  admin_enabled       = true
}
