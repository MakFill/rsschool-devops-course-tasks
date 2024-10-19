resource "aws_vpc" "main_vpc" {
  cidr_block = var.main_vpc_cidr_block
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}