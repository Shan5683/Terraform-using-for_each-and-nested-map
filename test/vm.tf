resource "azurerm_linux_virtual_machine" "vm1" {
   for_each =  var.linuxvm
  name                = each.value.name
  resource_group_name = azurerm_resource_group.RG1[each.value.resource_group_name].name
  location            = azurerm_resource_group.RG1[each.value.location].location
  size                = each.value.size

  admin_username = "azureuser"
  admin_password = "Password@12345"

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.NIC[each.value.nic].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

