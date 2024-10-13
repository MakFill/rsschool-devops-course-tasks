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

resource "aws_network_acl_rule" "public_inbound_ssh" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 120
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = var.IP
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "public_inbound_all_internal" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 130
  protocol       = "-1"
  rule_action    = "allow"
  egress         = false
  cidr_block     = aws_vpc.main_vpc.cidr_block
  from_port      = 0
  to_port        = 0
}

# Egress rules for public NACL
resource "aws_network_acl_rule" "public_outbound" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 100
  protocol       = "-1"
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
  protocol       = "-1"
  rule_action    = "allow"
  egress         = false
  cidr_block     = aws_vpc.main_vpc.cidr_block
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "private_outbound" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  protocol       = "-1"
  rule_action    = "allow"
  egress         = true
  cidr_block     = var.default_cidr
  from_port      = 0
  to_port        = 0
}