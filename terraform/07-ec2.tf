resource "aws_instance" "public-varnish" {

  ami                         = var.ami
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet-1a.id
  associate_public_ip_address = "true"
  vpc_security_group_ids      = [aws_security_group.public-sg.id]
  key_name                    = "MyMusicTeacher"

  tags = {

    Name = "dev-varnish-instance"

  }

}


resource "aws_instance" "private-web1" {

  ami                         = var.ami
  instance_type               = "t2.micro"
  iam_instance_profile        = aws_iam_instance_profile.champs_instance_profile.name
  subnet_id                   = aws_subnet.private-subnet-1a.id
  associate_public_ip_address = "false"
  vpc_security_group_ids      = [aws_security_group.private-sg.id]
  key_name                    = "MyMusicTeacher"

  tags = {

    Name = "dev-web1-instance"

  }

}

resource "aws_instance" "private-db" {

  ami                         = var.ami
  instance_type               = "t2.micro"
  iam_instance_profile        = aws_iam_instance_profile.champs_instance_profile.name
  subnet_id                   = aws_subnet.private-db-subnet-1a.id
  associate_public_ip_address = "false"
  vpc_security_group_ids      = [aws_security_group.private-db-sg.id]
  key_name                    = "MyMusicTeacher"

  tags = {

    Name = "dev-db-instance"

  }

}
