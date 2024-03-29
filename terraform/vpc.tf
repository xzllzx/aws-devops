# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

# VPC Subnets
resource "aws_subnet" "public_subnets" {
  # Define the subnet AZs and CIDR blocks
  for_each = { for idx, az in var.availability_zones : idx => az }

  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.value
  cidr_block              = var.public_subnet_cidr_blocks[each.key]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnets" {
  # Define the subnet AZs and CIDR blocks
  for_each = { for idx, az in var.availability_zones : idx => az }

  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.value
  cidr_block              = var.private_subnet_cidr_blocks[each.key]
  map_public_ip_on_launch = false
}

# IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public_rt_a" {
  for_each = aws_subnet.public_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "private_rt_a" {
  for_each = aws_subnet.private_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_rt.id
}