terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  client_id       = "a4b70489-5962-49f6-85e2-5c9b4a66fce6"
  tenant_id       = "2cddd894-138f-433f-8fcc-69112c0f4bc6"
  subscription_id = "9378e884-6493-464b-ae6a-78752959594b"
}
