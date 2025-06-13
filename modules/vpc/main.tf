# יצירת VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main-vpc"
  }
}

# יצירת תת-רשת ציבורית 1
resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = var.az1
  map_public_ip_on_launch = true # מאפשר הקצאת IP ציבורי למופעים בתת-רשת זו

  tags = {
    Name = "public-subnet-1"
  }
}

# יצירת תת-רשת ציבורית 2
resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = var.az2
  map_public_ip_on_launch = true # מאפשר הקצאת IP ציבורי למופעים בתת-רשת זו

  tags = {
    Name = "public-subnet-2"
  }
}

# יצירת Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

# יצירת Route Table ציבורי
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  # ניתוב תעבורה לאינטרנט דרך ה-Internet Gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# שיוך Route Table לתת-רשת ציבורית 1
resource "aws_route_table_association" "public_1_assoc" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

# שיוך Route Table לתת-רשת ציבורית 2
resource "aws_route_table_association" "public_2_assoc" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}
