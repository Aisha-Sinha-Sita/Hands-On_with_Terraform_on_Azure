terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {

    organization = "Aisha-Sita"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  subscription_id = "28e1e42a-4438-4c30-9a5f-7d7b488fd883"
  features {}
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-dfe92732-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage" {
  source  = "app.terraform.io/Aisha-Sita/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "aishasinha15"
}