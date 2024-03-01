terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    external = {

    }
  }
}

provider "azurerm" {
  subscription_id = "688e93a1-8b92-408b-881e-16ebfab5fc3d"
  features {}
}
