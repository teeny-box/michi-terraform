resource "aws_security_group" "michi_sg" {
  name_prefix = "michi-sg"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "michi_sg_ingress_ssh" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.michi_sg.id
}

resource "aws_security_group_rule" "michi_sg_ingress_http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.michi_sg.id
}

resource "aws_security_group_rule" "michi_sg_ingress_https" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.michi_sg.id
}

resource "aws_security_group_rule" "michi_sg_egress_all" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.michi_sg.id
}