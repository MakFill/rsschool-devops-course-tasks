output "vpc_sg_id" {
  value      = aws_security_group.vpc_sg.id
  description = "VPC SG"
}

output "public_sg_id" {
  value      = aws_security_group.public_sg.id
  description = "Public Subnet SG"
}

output "private_sg_id" {
  value      = aws_security_group.private_sg.id
  description = "Private Subnet SG"
}

output "bastion_sg_id" {
  value       = aws_security_group.bastion_sg.id
  description = "Bastion Host SG"
}