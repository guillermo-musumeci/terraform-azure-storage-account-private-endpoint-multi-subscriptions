###########################
## Azure Provider - Main ##
###########################

# Define Terraform provider
terraform {
  required_providers {
    azurerm = {
      version = "~>3.7"
      source = "hashicorp/azurerm"
      configuration_aliases = [ azurerm.customer, azurerm.core ]
    }
  }
}

# Configure the Azure provider
provider "azurerm" {
  alias = "customer"
  features {}
  environment     = "public"
  subscription_id = var.azure-subscription-id
  client_id       = var.azure-client-id
  client_secret   = var.azure-client-secret
  tenant_id       = var.azure-tenant-id
}

provider "azurerm" { 
  alias = "core"
  features {}
  environment     = "public"
  subscription_id = var.core-azure-subscription-id
  client_id       = var.azure-client-id
  client_secret   = var.azure-client-secret
  tenant_id       = var.azure-tenant-id
}
