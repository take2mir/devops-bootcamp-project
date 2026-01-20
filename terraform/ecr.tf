resource "aws_ecr_repository" "web" {
  name                 = "devops-bootcamp/final-project-amiruddin"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "devops-bootcamp/final-project-amiruddin"
}
}