resource "azurerm_public_ip" "PIP" {
    for_each = var.pip
  name                = each.value.name
  resource_group_name = azurerm_resource_group.RG1[each.value.resource_group_name].name
  location            = azurerm_resource_group.RG1[each.value.location].location
  allocation_method   = each.value.allocation_method

}