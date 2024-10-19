output "public_subnet_1_id" {
  value       = aws_subnet.public_subnets[0].id
  description = "The ID of the first public subnet"
}

output "public_subnet_2_id" {
  value       = aws_subnet.public_subnets[1].id
  description = "The ID of the second public subnet"
}

output "private_subnet_1_id" {
  value       = aws_subnet.private_subnets[0].id
  description = "The ID of the first private subnet"
}

output "private_subnet_2_id" {
  value       = aws_subnet.private_subnets[1].id
  description = "The ID of the second private subnet"
}

output "main_vpc_id" {
  value       = aws_vpc.main_vpc.id
}

output "main_vpc_cidr_block" {
  value       = aws_vpc.main_vpc.cidr_block
}

