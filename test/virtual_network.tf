resource "azurerm_virtual_network" "VNET" {
  for_each            = var.vnet
  name                = each.value.name
  location            = azurerm_resource_group.RG1[each.value.location].location
  resource_group_name = azurerm_resource_group.RG1[each.value.resource_group_name].name
  address_space       = each.value.address_space
}