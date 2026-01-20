resource "aws_instance" "web" {
  ami                         = "ami-00d8fc944fb171e29"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  private_ip                  = "10.0.0.5"
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = "bootcamp-web-server"
    Role = "web"
  }
}

resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
  domain   = "vpc"

  tags = {
    Name = "bootcamp-web-eip"
  }
}

resource "aws_instance" "ansible" {
  ami                    = "ami-00d8fc944fb171e29"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private.id
  private_ip             = "10.0.0.135"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name

  associate_public_ip_address = false

  tags = {
    Name = "bootcamp-ansible-controller"
    Role = "ansible"
  }
}

resource "aws_instance" "monitoring" {
  ami                    = "ami-00d8fc944fb171e29"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private.id
  private_ip             = "10.0.0.136"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name

  associate_public_ip_address = false

  tags = {
    Name = "bootcamp-monitoring-server"
    Role = "monitoring"
  }
}


