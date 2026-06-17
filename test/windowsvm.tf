resource "azurerm_windows_virtual_machine" "vm1" {
    for_each = var.windowsvm
  name                = each.value.name
  resource_group_name = azurerm_resource_group.RG1[each.value.resource_group_name].name
  location            = azurerm_resource_group.RG1[each.value.location].location
  size                = each.value.size

  admin_username = "azureuser"
  admin_password = "Password@12345"
 

  network_interface_ids = [
    azurerm_network_interface.NIC[each.value.nic].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku       = "win11-25h2-pro"
    version   = "latest"
    
  }
}