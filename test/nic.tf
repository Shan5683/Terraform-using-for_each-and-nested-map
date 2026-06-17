resource "azurerm_network_interface" "NIC" {
    for_each = var.nic
  name                = each.value.name
  location            = azurerm_resource_group.RG1[each.value.location].location
  resource_group_name = azurerm_resource_group.RG1[each.value.location].name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet[each.value.subnet].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = each.value.public_ip_address_id != null ? azurerm_public_ip.PIP[each.value.public_ip_address_id ].id : null
  }
}