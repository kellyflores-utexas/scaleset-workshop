provider "azurerm" {
  // sub-z-autosol-deltad-n-001
  subscription_id = ""
  features {}
}

data "azurerm_client_config" "current" {}

# A resource group is like a folder for related resources. You can delete the resource group to delete all resources in it.
resource "azurerm_resource_group" "rg" {
    name = "vmss-workshop-${var.unique_identifier}"
    location = "Central US"
}

