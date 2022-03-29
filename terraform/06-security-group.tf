
resource "aws_security_group" "public-sg" {
  name        = "public-sg"
  description = "Web & SSH Security Group"
  vpc_id      = aws_vpc.dev-vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-music-teacher-public-sg"
  }
}

resource "aws_security_group" "private-sg" {
  name        = "private-sg"
  description = "Web & SSH Security Group"
  vpc_id      = aws_vpc.dev-vpc.id
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    security_groups = [
      "${aws_security_group.public-sg.id}",
    ]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    security_groups = [
      "${aws_security_group.public-sg.id}",
    ]
  }


  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      "${aws_security_group.public-sg.id}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-music-teacher-private-sg"
  }
}

resource "aws_security_group" "private-db-sg" {
  name        = "private-db-sg"
  description = "Database & SSH Security Group"
  vpc_id      = aws_vpc.dev-vpc.id
  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    security_groups = [
      "${aws_security_group.private-sg.id}",
    ]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      "${aws_security_group.private-sg.id}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-music-teacher-private-db-sg"
  }
}
