resource "aws_eip" "nat_eip" {
}

resource "aws_nat_gateway" "nat" {
  depends_on    = [aws_internet_gateway.igw]
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id 
}