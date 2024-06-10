variable "cidr_block_vpc" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_block_subnet" {
  default = "10.0.1.0/24"
}