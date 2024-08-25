terraform {
 required_providers {
    azurerm = {
     source = "hasicorp/azurerm"
     version = "~> 3.0"
     }
  }
}

provider "azurerm" {
   features { }
}
