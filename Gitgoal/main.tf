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
resource "azurerm_public_ip" "pip" {
name= "man-pip"
location = "westus"
resource_group_name = "man-rg"
allocation_method = "Static"
}

resource "azurerm_network_interface" "nic" {
     name = "man-nic"
     location ="westus"
     resource_group_name ="man-rg"

ip_configuration {
     name = "nicip"
     subnet_id = azurerm_subnet.subnet.id
     private_ip_address_allocation = "Dynamic"
     public_ip_address_id = azurerm_public_ip.pip.id
}
}

resource "azurerm_linux_virtual_machine" "vm" {
   name = "man-vm"
location = "westus"
resource_group_name = "man-rg"
size = "Standard_F2"
admin_usernamw = "adminuser"
admin_passward = "admin@12345"
disable_password_authentication = "False"
network_interface_ids = [azurerm.resource_network_interface.id]


 
 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


