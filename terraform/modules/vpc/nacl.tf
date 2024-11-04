resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "public-nacl"
  }
}

resource "aws_network_acl_rule" "public_inbound" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.default_cidr
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "public_inbound_https" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 110
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.default_cidr
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "public_inbound_all_internal" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 120
  protocol       = "all"
  rule_action    = "allow"
  egress         = false
  cidr_block     = aws_vpc.main_vpc.cidr_block
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_inbound_ssh" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 130
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.IP
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "public_inbound_icmp" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 140
  protocol       = "icmp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.default_cidr
  from_port      = -1
  to_port        = -1
}

resource "aws_network_acl_rule" "public_inbound_ephemeral" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 150
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.default_cidr
  from_port      = 1024
  to_port        = 65535
}


resource "aws_network_acl_rule" "public_inbound_SOCKS" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 160
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.default_cidr
  from_port      = 1080
  to_port        = 1080
}

resource "aws_network_acl_rule" "public_outbound" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 100
  protocol       = "all"
  rule_action    = "allow"
  egress         = true
  cidr_block     = var.default_cidr
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "private-nacl"
  }
}

resource "aws_network_acl_rule" "private_inbound" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  protocol       = "all"
  rule_action    = "allow"
  egress         = false
  cidr_block     = aws_vpc.main_vpc.cidr_block
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "private_inbound_icmp" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 110
  protocol       = "icmp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.default_cidr
  from_port      = -1
  to_port        = -1
}

resource "aws_network_acl_rule" "private_inbound_http" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 120
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.default_cidr
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "private_inbound_https" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 130
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.default_cidr
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "private_inbound_ephemeral" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 140
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.default_cidr
  from_port      = 1024
  to_port        = 65535
}


resource "aws_network_acl_rule" "private_inbound_SOCKS" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 150
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.default_cidr
  from_port      = 1080
  to_port        = 1080
}

resource "aws_network_acl_rule" "private_outbound" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  protocol       = "all"
  rule_action    = "allow"
  egress         = true
  cidr_block     = var.default_cidr
  from_port      = 0
  to_port        = 0
}

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