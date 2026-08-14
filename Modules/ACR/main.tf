resource "azurerm_container_registry" "example" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = "Premium"
  public_network_access_enabled = false
}