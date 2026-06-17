# Terraform-using-for_each-and-nested-map
Resource Group (task-rg2)
│
├── VNet: vntest1 (10.0.0.0/16)
│   ├── frontend_subnet (10.0.1.0/24)
│   │   ├── frontend-nic
│   │   ├── publicip1
│   │   └── frontend-vm (Linux)
│   │
│   ├── backend_subnet (10.0.2.0/24)
│   │   ├── backend-nic
│   │   └── windows-vm
│   │
│   └── database_subnet (10.0.3.0/24)
│
├── VNet: vntest_bastian (10.1.0.0/16)
│   ├── AzureBastionSubnet (10.1.10.0/24)
│   ├── publicip2BASTION
│   └── prod-bastion
│
├── NSGs
│   ├── frontend-nsg
│   ├── backend-nsg
│   └── database-nsg
│
└── VNet Peering
    ├── mgmt-to-app
    └── app-to-mgmt
