# VPC
resource "aws_vpc" "michi-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "michi-vpc"
  }
}

# Subnets
resource "aws_subnet" "michi-public-1" {
  vpc_id = aws_vpc.michi-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "michi-public-1"
  }
}

resource "aws_subnet" "michi-public-2" {
  vpc_id = aws_vpc.michi-vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-northeast-2b"

  tags = {
    Name = "michi-public-2"
  }
}

resource "aws_subnet" "michi-private-1" {
  vpc_id = aws_vpc.michi-vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "michi-private-1"
  }
}

resource "aws_subnet" "michi-private-2" {
  vpc_id = aws_vpc.michi-vpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "ap-northeast-2b"

  tags = {
    Name = "michi-private-2"
  }
}

# IGW
resource "aws_internet_gateway" "michi-gw" {
  vpc_id = aws_vpc.michi-vpc.id

  tags = {
    Name = "michi-gw"
  }
}

# route tables
resource "aws_route_table" "michi-public-rt" {
  vpc_id = aws_vpc.michi-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.michi-gw.id
  }

  tags = {
    Name = "michi-public-rt"
  }
}

# route associations public
resource "aws_route_table_association" "michi-public-1-a" {
  subnet_id = aws_subnet.michi-public-1.id
  route_table_id = aws_route_table.michi-public-rt.id
}

resource "aws_route_table_association" "michi-public-2-a" {
  subnet_id = aws_subnet.michi-public-2.id
  route_table_id = aws_route_table.michi-public-rt.id
}