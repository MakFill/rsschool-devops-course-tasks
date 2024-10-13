resource "aws_instance" "private_instance" {
  ami = var.bastion_ami
  instance_type = var.bastion_instance_type
  subnet_id = aws_subnet.private_subnets[0].id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
}