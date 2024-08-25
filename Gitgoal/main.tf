resource "azurerm_resource_group" "rgblock" {
  name = "man-rg"
  location = "westus"
}

resource "azurerm_storage_account" "stblock" {
name = "man000783st"
location = "westus"
resource_group_name = "man-rg"
account_replaction_type = "LRS"
account_tier = "Standard"
}

resource "azurerm_storage_container" "con" {
     name = "man-con"
     storage_account_name = "man-st"
     container_access_type = "private"
}

resource "azurerm_virtual_network" "vnetblock" {
name = "man-vnet"
location = "westus"
resource_group_name = "man-rg"
address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
name = "man-subnet"
location = "westus"
resource_group_named= "man-rg"
virtual_network_name = "man-vnet"
address_prefix = ["10.0.1.0/24"]
}

