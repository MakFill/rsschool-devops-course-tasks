resource "aws_subnet" "public_subnets" {
 count                   = length(var.public_subnet_cidrs)
 vpc_id                  = aws_vpc.main_vpc.id
 cidr_block              = element(var.public_subnet_cidrs, count.index)
 availability_zone       = element(var.azs, count.index)
 map_public_ip_on_launch = true
 depends_on              = [aws_vpc.main_vpc]

 tags = {
   Name                  = "Public Subnet ${count.index + 1}"
 }
}
 
resource "aws_subnet" "private_subnets" {
 count                   = length(var.private_subnet_cidrs)
 vpc_id                  = aws_vpc.main_vpc.id
 cidr_block              = element(var.private_subnet_cidrs, count.index)
 availability_zone       = element(var.azs, count.index)
 depends_on              = [aws_vpc.main_vpc]

 tags = {
   Name                  = "Private Subnet ${count.index + 1}"
 }
}

resource "aws_route_table" "rt_public" {
 vpc_id                  = aws_vpc.main_vpc.id
 depends_on              = [aws_internet_gateway.igw]

 route {
   cidr_block            = var.default_cidr
   gateway_id            = aws_internet_gateway.igw.id
 }
}

resource "aws_route_table" "rt_private" {
 vpc_id                  = aws_vpc.main_vpc.id
 depends_on              = [aws_nat_gateway.nat]

 route {
   cidr_block            = var.default_cidr
   nat_gateway_id        = aws_nat_gateway.nat.id
 }
}

resource "aws_route_table_association" "public_subnet_association" {
 count                  = length(var.public_subnet_cidrs)
 subnet_id              = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id         = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "private_subnet_association" {
 count                  = length(var.private_subnet_cidrs)
 subnet_id              = element(aws_subnet.private_subnets[*].id, count.index)
 route_table_id         = aws_route_table.rt_private.id
}