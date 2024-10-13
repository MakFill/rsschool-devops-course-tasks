resource "aws_route_table" "rt_public" {
 vpc_id = aws_vpc.main_vpc.id
 
 route {
   cidr_block = var.default_cidr
   gateway_id = aws_internet_gateway.igw.id
 }
}

resource "aws_route_table" "rt_private" {
 vpc_id = aws_vpc.main_vpc.id
 
 route {
   cidr_block = var.default_cidr
   nat_gateway_id = aws_nat_gateway.nat.id
 }
}