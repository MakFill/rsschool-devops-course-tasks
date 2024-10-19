resource "aws_instance" "private_instance" {
  ami = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id = aws_subnet.private_subnets[0].id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name = var.key_pair
  
  tags = {
    Name = "Example ec2 instance to connect with Bastion Host"
  }
}

resource "aws_instance" "public_instance" {
  ami = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id = aws_subnet.public_subnets[1].id
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  key_name = var.key_pair
  associate_public_ip_address = true
  
  tags = {
    Name = "Public Example instance"
  }
}