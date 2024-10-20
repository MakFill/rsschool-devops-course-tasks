resource "aws_vpc" "main_vpc" {
  cidr_block           = var.main_vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id               = aws_vpc.main_vpc.id

  depends_on           = [aws_vpc.main_vpc]
}