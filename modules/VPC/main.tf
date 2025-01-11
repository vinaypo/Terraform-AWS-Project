resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = var.instance_tenancy
  enable_dns_hostnames = true
  tags = {
    Name = var.vpcname
  }
}
#subnets
resource "aws_subnet" "public-1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.pubsub1-cidr
  availability_zone = var.az1
  map_public_ip_on_launch = true
  tags = {
    Name = var.public1-name
  }
}
resource "aws_subnet" "public-2" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.pubsub2-cidr
  availability_zone = var.az2
  map_public_ip_on_launch = true
  tags = {
    Name = var.public2-name
  }
}
resource "aws_subnet" "private-1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.prisub1-cidr
  availability_zone = var.az1
  map_public_ip_on_launch = false
  tags = {
    Name = var.private1-name
  }
}

#IGW
resource "aws_internet_gateway" "MyIGW" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = var.IGW-name
  }
}

#routetable-public
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = var.Cidr-block
    gateway_id = aws_internet_gateway.MyIGW.id
  }
  tags = {
    Name = var.PublicRoute-name
  }
}
resource "aws_main_route_table_association" "set-main" {
  vpc_id = aws_vpc.myvpc.id
  route_table_id = aws_route_table.public-rt.id
}

#subnets-associations
resource "aws_route_table_association" "pub-ass1" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id = aws_subnet.public-1.id
}
resource "aws_route_table_association" "pub-ass2" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id = aws_subnet.public-2.id
}

#routetable-private
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = var.PrivateRoute-name
  }
}

#subnets-association
resource "aws_route_table_association" "pri-ass1" {
  route_table_id = aws_route_table.private-rt.id
  subnet_id = aws_subnet.private-1.id
}

resource "aws_security_group" "LB-sg" {
  name = "ALB"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port = var.from_port2
    to_port = var.to_port2
    protocol = var.protocol
    cidr_blocks = [var.Cidr-block]
  }
  ingress {
    from_port = var.from_port3
    to_port = var.to_port3
    protocol = var.protocl
    cidr_blocks = [var.Cidr-block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.Cidr-block]
  }
  tags = {
    Name = var.LB_name
  }
}

resource "aws_security_group" "web-sg" {
  name = "web"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port = var.from_port1
    to_port = var.to_port1
    protocol = var.protocol
    cidr_blocks = [var.Cidr-block]

  }
  ingress {
    from_port = var.from_port2
    to_port = var.to_port2
    protocol = var.protocol
    security_groups = [aws_security_group.LB-sg.id]

  }
  ingress {
    from_port = var.from_port3
    to_port = var.to_port3
    protocol = var.protocl
    security_groups = [aws_security_group.LB-sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.Cidr-block]
  }
  tags = {
    Name = var.websec_name
  }
}