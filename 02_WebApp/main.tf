provider "azurerm" {
    features {}   
}

resource "azurerm_resource_group" "zerodemo" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_app_service_plan" "zerodemo" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.zerodemo.location
  resource_group_name = azurerm_resource_group.zerodemo.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "zerodemo" {
  name                = var.app_service_name
  location            = azurerm_resource_group.zerodemo.location
  resource_group_name = azurerm_resource_group.zerodemo.name
  app_service_plan_id = azurerm_app_service_plan.zerodemo.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}