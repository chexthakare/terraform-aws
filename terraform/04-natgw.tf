resource "aws_eip" "my-music-teacher-eip" {
  vpc = true
}



resource "aws_nat_gateway" "my-music-teacher-nat-gw" {
  allocation_id = aws_eip.my-music-teacher-eip.id
  subnet_id     = aws_subnet.public-subnet-1a.id

  tags = {
    Name = "mmt-${var.environment}-NAT-GW"
  }


  depends_on = [aws_internet_gateway.igw]

}


resource "aws_route_table" "my-music-teacher-public" {
  vpc_id = aws_vpc.dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "mmt-${var.environment}-public-route"
  }
}


resource "aws_route_table" "my-music-teacher-private" {
  vpc_id = aws_vpc.dev-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-music-teacher-nat-gw.id
  }
  tags = {
    Name = "mmt-${var.environment}-privateweb-route"
  }
}

resource "aws_route_table_association" "web-public-rt-1a" {

  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.my-music-teacher-public.id
}


resource "aws_route_table_association" "web-public-rt-1b" {

  subnet_id      = aws_subnet.public-subnet-1b.id
  route_table_id = aws_route_table.my-music-teacher-public.id
}

resource "aws_route_table_association" "web-private-rt-1a" {

  subnet_id      = aws_subnet.private-subnet-1a.id
  route_table_id = aws_route_table.my-music-teacher-private.id
}

resource "aws_route_table_association" "web-private-rt-1b" {

  subnet_id      = aws_subnet.private-subnet-1b.id
  route_table_id = aws_route_table.my-music-teacher-private.id
}

resource "aws_route_table_association" "db-private-rt-1a" {

  subnet_id      = aws_subnet.private-db-subnet-1a.id
  route_table_id = aws_route_table.my-music-teacher-private.id
}

resource "aws_route_table_association" "db-private-rt-1b" {

  subnet_id      = aws_subnet.private-db-subnet-1b.id
  route_table_id = aws_route_table.my-music-teacher-private.id
}
