                                                                                                                                                                                            terraform {
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
  required_version = ">= 1.3.0"
}

# Configure AWS Provider
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = "Terraform-Multicloud"
      ManagedBy   = "Terraform"
    }
  }
}

# Configure Azure Provider
provider "azurerm" {
  features {}
}

# Configure Google Cloud Provider
provider "google" {
  project = var.project
  region  = var.gcp_region
}

# Shared variables
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP region to deploy resources"
  type        = string
  default     = "us-west1"
}