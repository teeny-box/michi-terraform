output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.michi-vpc.id
}

output "subnet1_id" {
  value = aws_subnet.michi-public-1.id
}

output "subnet2_id" {
  value = aws_subnet.michi-public-2.id
}