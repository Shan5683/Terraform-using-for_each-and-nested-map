rg = {

  rg1 = {
    name     = "task-rg2"
    location = "central india"
  }

}

#virtual_network
vnet = {
  vnet1 = {
    name                = "vntest1"
    location            = "rg1"
    resource_group_name = "rg1"
    address_space       = ["10.0.0.0/16"]
  }

  vnet2 = {
    name                = "vntest_bastian"
    location            = "rg1"
    resource_group_name = "rg1"
    address_space       = ["10.1.0.0/16"]
  }
}

# subnet
subnet = {
  subnet1 = {
    name                 = "frontend_subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {
    name                 = "backend_subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }

  subnet3 = {
    name                 = "database_subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.3.0/24"]
  }

  subnet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet2"
    address_prefixes     = ["10.1.10.0/24"]
  }
}

#NSG

nsg = {
  NSG1 = {
    name                = "frontend-nsg"
    location            = "rg1"
    resource_group_name = "rg1"
  }

  NSG2 = {
    name                = "backend-nsg"
    location            = "rg1"
    resource_group_name = "rg1"
  }

  NSG3 = {
    name                = "database-nsg"
    location            = "rg1"
    resource_group_name = "rg1"
  }
}

#PIP

pip = {
  pip1 ={
      name                = "publicip1"
  resource_group_name = "rg1"
  location            = "rg1"
  allocation_method   = "Static"
  sku = "Basic"
  }

   pip2 ={
      name                = "publicip2BASTION"
  resource_group_name = "rg1"
  location            = "rg1"
  allocation_method   = "Static"
  sku = "Standard"
  }
}

#nic

nic ={
  nic1 = {
     name                = "frontend-nic"
  location            = "rg1"
  resource_group_name = "rg1"
  subnet = "subnet1"
  public_ip_address_id = "pip1"

  }

  nic2 = {
     name                = "backend-nic"
  location            = "rg1"
  resource_group_name = "rg1"
  subnet = "subnet2"
    public_ip_address_id = null

  }

}

#vm

linuxvm = {
  vm1 = {
    name                = "frontend-vm"
    resource_group_name = "rg1"
    location            = "rg1"
    size                = "Standard_D2s_v3"
    admin_username      = "azureuser"
    admin_password      = "Password@12345"
    nic                 = "nic1"
  }
}

windowsvm = {
  wvm1 = {
        name                = "windows-vm"
    resource_group_name = "rg1"
    location            = "rg1"
    size                = "Standard_D2s_v3"
    admin_username      = "azureuser"
    admin_password      = "Password@12345"
    nic                 = "nic2"
  }
  }

# bastion
bastion = {
  bastion1= {
    name                = "prod-bastion"
  location            = "rg1"
  resource_group_name = "rg1"

  }
}

#vnetpeering
vnp = {
vnp1 = {
   name                      = "mgmt-to-app"
  resource_group_name       = "rg1"
  virtual_network_name      = "vnet2"
  remote_virtual_network_id = "vnet1"
}

vnp2 = {
   name                      = "app-to-mgmt"
  resource_group_name       = "rg1"
  virtual_network_name      = "vnet1"
  remote_virtual_network_id = "vnet2"
}
}
