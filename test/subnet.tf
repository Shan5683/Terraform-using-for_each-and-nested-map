resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.RG1[each.value.resource_group_name].name
  virtual_network_name = azurerm_virtual_network.VNET[each.value.virtual_network_name].name
  address_prefixes     = each.value.address_prefixes
  

}