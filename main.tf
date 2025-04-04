provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    scm_type = "GitHub"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "0"
  }

  lifecycle {
    ignore_changes = [
      site_config[0].scm_type # to avoid recreation if GitHub link changes externally
    ]
  }
}

resource "azurerm_app_service_source_control" "source_control" {
  app_id     = azurerm_app_service.app_service.id
  repo_url   = var.repo_url
  branch     = var.branch
  use_manual_integration = true
  use_mercurial = false
}
