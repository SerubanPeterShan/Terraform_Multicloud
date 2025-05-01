# Variable declarations
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair to use for AWS instances"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
}

variable "admin_username" {
  description = "Admin username for Azure VM"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the public SSH key for VM access"
  type        = string
}

variable "project" {
  description = "GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP region to deploy resources"
  type        = string
}

variable "ssh_user" {
  description = "SSH username for GCP VM access"
  type        = string
}