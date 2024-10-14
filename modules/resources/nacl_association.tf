resource "aws_network_acl_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  network_acl_id = aws_network_acl.public.id
}

resource "aws_network_acl_association" "private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  network_acl_id = aws_network_acl.private.id
}