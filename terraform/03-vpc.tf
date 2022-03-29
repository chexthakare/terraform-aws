resource "aws_vpc" "dev-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "mymusicteacher-dev"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = {
    Name = "${var.environment}-InternetGateway"
  }
}
