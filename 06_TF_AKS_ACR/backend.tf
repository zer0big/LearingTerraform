terraform {
  backend "azurerm" {
    resource_group_name     = "ud-terraform-demo-rg"
    storage_account_name    = "udzerotfstate"
    container_name          = "ud-zerotfstatecont"
    key                     = "tf.tfstate"    
  }
}