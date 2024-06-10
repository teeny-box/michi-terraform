resource "tls_private_key" "make_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "michi_key" {
  key_name = "michi_key"
  public_key = tls_private_key.make_key.public_key_openssh
}

resource "local_file" "download_key" {
  filename = "michi_key.pem"
  content = tls_private_key.make_key.private_key_pem
}