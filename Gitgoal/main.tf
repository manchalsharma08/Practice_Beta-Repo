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

