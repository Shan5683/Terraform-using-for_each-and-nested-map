resource "azurerm_bastion_host" "bastion" {
    for_each = var.bastion
  name                = each.value.name
  location            = azurerm_resource_group.RG1[each.value.location].location
  resource_group_name = azurerm_resource_group.RG1[each.value.resource_group_name].name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.subnet["subnet4"].id
    public_ip_address_id = azurerm_public_ip.PIP["pip2"].id
  }
}