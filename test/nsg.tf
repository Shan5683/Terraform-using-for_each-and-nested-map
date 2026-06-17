resource "azurerm_network_security_group" "NSG" {
  for_each            = var.nsg
  name                = each.value.name
  location            = azurerm_resource_group.RG1[each.value.location].location
  resource_group_name = azurerm_resource_group.RG1[each.value.resource_group_name].name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}