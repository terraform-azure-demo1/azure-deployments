module "avm-res-resources-resourcegroup" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.2.1"
  location = var.location
  name     = var.resource_group_name
}

module "avm-res-network-virtualnetwork" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.8.1"
  name    = var.vnet_name

  resource_group_name = module.avm-res-resources-resourcegroup.name
  location            = var.location
  address_space       = var.address_space

  subnets = {
    subnet1 = {
      name             = var.subnet_name
      address_prefixes = var.subnet_address_prefixes
    }
  }
}
