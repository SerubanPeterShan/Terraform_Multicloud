terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
}

provider "google" {
  project = var.project
  region  = var.gcp_region
}



# AWS Module
module "aws_vm" {
  source = "./aws"
  
  aws_region          = var.aws_region
  key_name            = var.key_name
  ssh_public_key_path = var.ssh_public_key_path
}

# Azure Module
module "azure_vm" {
  source = "./azure"
  
  location            = var.location
  admin_username      = var.admin_username
  ssh_public_key_path = var.ssh_public_key_path
}

# GCP Module
module "gcp_vm" {
  source = "./gcp"
  
  project             = var.project
  region              = var.gcp_region
  ssh_user            = var.ssh_user
  ssh_public_key_path = var.ssh_public_key_path
}