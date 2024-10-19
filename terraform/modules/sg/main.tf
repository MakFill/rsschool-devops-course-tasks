resource "aws_security_group" "vpc_sg" {
  name          = "vpc_sg"
  vpc_id        = var.main_vpc_id
  description   = "Allow internet access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.IP]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.IP]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = [var.default_cidr]
  }
}

resource "aws_security_group" "public_sg" {
  name          = "public_sg"
  vpc_id        = var.main_vpc_id
  description   = "Allow internal VPC traffic and internet access"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = [var.main_vpc_cidr_block]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.IP]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.IP]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = [var.default_cidr]
  }
}

resource "aws_security_group" "bastion_sg" {
  vpc_id        = var.main_vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.IP]
    description = "Allow SSH access from particular IP" 
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.IP]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = [var.default_cidr]
  }
}

resource "aws_security_group" "private_sg" {
  name          = "private-sg"
  vpc_id        = var.main_vpc_id
  description   = "Allow internal communication within the VPC and all outbound traffic"
  depends_on = [aws_security_group.bastion_sg]

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.default_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = [var.default_cidr]
  }
}

