#main.tf

terraform {
  required_version = ">=1.3.2"  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.48"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "tfstate18500"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }

}

module "regionA" {
  source = "./regionA"
}

module "regionB" {
  source = "./regionB"
}


provider "azurerm" {
  features {}
}
