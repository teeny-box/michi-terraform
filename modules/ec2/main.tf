provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../vpc"
}

resource "aws_instance" "michi_ec2" {
  ami = "ami-03221589fd7c8f183"
  instance_type = var.instance_type
  key_name = aws_key_pair.michi_key.key_name
  vpc_security_group_ids = [aws_security_group.michi_sg.id]
  subnet_id = module.vpc.subnet1_id
  associate_public_ip_address = true

  tags = {
    Name = "michi-ec2"
  }
}

resource "aws_eip" "michi_eip" {
  domain = "vpc"
}

resource "aws_eip_association" "michi_eip_assoc" {
  instance_id   = aws_instance.michi_ec2.id
  allocation_id = aws_eip.michi_eip.id
}