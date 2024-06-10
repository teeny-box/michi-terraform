output "repository_urls" {
  value = aws_ecr_repository.repositories[*].repository_url
}