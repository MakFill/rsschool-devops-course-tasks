resource "aws_instance" "bastion" {
  ami = var.bastion_ami
  instance_type = var.bastion_instance_type
  subnet_id = aws_subnet.public_subnets[0].id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "Bastion host"
  }
}