# # Old method
# provider "azurerm" {
#   version = "2.40.0"
#   features {}
# }

# New method
provider "azurerm" {
    features {}   
}

terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "2.40.0"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name = "myFirstRG"
  location = "koreacentral"
}