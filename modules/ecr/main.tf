resource "aws_ecr_repository" "repositories" {
  count = length(var.repositories)
  name = var.repositories[count.index]

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = var.repositories[count.index]
  }
}