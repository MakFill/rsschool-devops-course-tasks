# resource "aws_instance" "private_instance_1" {
#   ami                         = var.ec2_ami
#   instance_type               = var.ec2_instance_type
#   subnet_id                   = var.private_subnet_1_id
#   vpc_security_group_ids      = [var.private_sg_id]
#   key_name = var.key_pair
  
#   tags = {
#     Name = "k3s server"
#   }
# }

# resource "aws_instance" "private_instance_2" {
#   ami                         = var.ec2_ami
#   instance_type               = var.ec2_instance_type
#   subnet_id                   = var.private_subnet_2_id
#   vpc_security_group_ids      = [var.private_sg_id]
#   key_name = var.key_pair
  
#   tags = {
#     Name = "k3s agent"
#   }
# }

resource "aws_instance" "public_instance_1" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type_small
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  key_name                    = var.key_pair
  associate_public_ip_address = true
  
  tags = {
    Name = "k3s server"
  }
}

# resource "aws_instance" "public_instance_2" {
#   ami                         = var.ec2_ami
#   instance_type               = var.ec2_instance_type_small
#   subnet_id                   = var.public_subnet_id
#   vpc_security_group_ids      = [var.public_sg_id]
#   key_name                    = var.key_pair
#   associate_public_ip_address = true
  
#   tags = {
#     Name = "k3s agent"
#   }
# }