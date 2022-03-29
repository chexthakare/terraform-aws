resource "aws_subnet" "public-subnet-1a" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "mmt-${var.environment}-public-subnet-1a"
  }
}

resource "aws_subnet" "public-subnet-1b" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.public_subnet_1b_cidr
  availability_zone = "ap-south-1b"

  tags = {
    Name = "mmt-${var.environment}-public-subnet-1b"
  }
}

resource "aws_subnet" "private-subnet-1a" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.private_subnet_1a_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "mmt-${var.environment}-private-subnet-1a"
  }
}

resource "aws_subnet" "private-subnet-1b" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.private_subnet_1b_cidr
  availability_zone = "ap-south-1b"

  tags = {
    Name = "mmt-${var.environment}-private-subnet-1b"
  }
}

resource "aws_subnet" "private-db-subnet-1a" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.private_db_subnet_1a_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "mmt-${var.environment}-private-db-subnet-1a"
  }
}


resource "aws_subnet" "private-db-subnet-1b" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.private_db_subnet_1b_cidr
  availability_zone = "ap-south-1b"

  tags = {
    Name = "mmt-${var.environment}-private-db-subnet-1b"
  }
}

