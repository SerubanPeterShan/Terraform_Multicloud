output "instance_id" {
  description = "The ID of the AWS EC2 instance"
  value       = aws_instance.free_tier_vm.id
}

output "public_ip" {
  description = "The public IP address of the AWS EC2 instance"
  value       = aws_instance.free_tier_vm.public_ip
}