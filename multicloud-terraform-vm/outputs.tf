output "aws_instance_id" {
  description = "AWS EC2 instance ID"
  value       = module.aws_vm.instance_id
}

output "aws_public_ip" {
  description = "AWS EC2 public IP address"
  value       = module.aws_vm.public_ip
}

output "azure_vm_id" {
  description = "Azure VM resource ID"
  value       = module.azure_vm.vm_id
}

output "azure_public_ip" {
  description = "Azure VM public IP address"
  value       = module.azure_vm.public_ip
}

output "gcp_instance_name" {
  description = "GCP instance name"
  value       = module.gcp_vm.instance_name
}

output "gcp_public_ip" {
  description = "GCP VM public IP address"
  value       = module.gcp_vm.public_ip
}

output "ssh_commands" {
  description = "SSH commands to connect to each VM"
  value = {
    aws   = "ssh -i ~/.ssh/id_rsa ec2-user@${module.aws_vm.public_ip}"
    azure = "ssh -i ~/.ssh/id_rsa ${var.admin_username}@${module.azure_vm.public_ip}"
    gcp   = "ssh -i ~/.ssh/id_rsa ${var.ssh_user}@${module.gcp_vm.public_ip}"
  }
}