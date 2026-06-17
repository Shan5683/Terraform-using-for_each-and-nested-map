resource "azurerm_virtual_network_peering" "vnet1_to_vnet2" {
    for_each = var.vnp
  name                      = "mgmt-to-app"
  resource_group_name       = azurerm_resource_group.RG1["rg1"].name
  virtual_network_name      = azurerm_virtual_network.VNET[each.value.virtual_network_name].name
  remote_virtual_network_id = azurerm_virtual_network.VNET[each.value.remote_virtual_network_id].id

  allow_virtual_network_access = true
}

