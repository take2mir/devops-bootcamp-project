resource "aws_security_group" "web" {
  name        = "bootcamp-web-sg"
  description = "Web server security group"
  vpc_id      = aws_vpc.devops_vpc.id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Node Exporter from monitoring server"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.136/32"]
  }

  ingress {
    description = "SSH from VPC subnet only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bootcamp-web-sg"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "bootcamp-private-sg"
  description = "Private subnet security group"
  vpc_id      = aws_vpc.devops_vpc.id

  ingress {
    description = "SSH from VPC subnet only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bootcamp-private-sg"
  }
}
