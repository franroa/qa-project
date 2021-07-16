terraform {
  backend "azurerm" {
    resource_group_name   = "frantstate"
    storage_account_name  = "frantstate31845"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
  }
}

# Configure the Azure provider
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "eastus"
}