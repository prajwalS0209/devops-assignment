provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "ap-south-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ucube-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "ucube-vpc"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       =  "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public_subnet"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       =  "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public_subnet"
  }
}

resource "aws_instance" "private_ec2" {
  for_each      = toset(var.public_instances)
  ami           = "ami-0614680123427b75e"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id

  tags = {
    Name = "instance"
  }
}

resource "aws_instance" "public_ec2" {
  ami           = "ami-0614680123427b75e"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "instance"
  }
}

resource "aws_eip" "eip" {
  for_each = aws_instance.private_ec2
  domain   = "vpc"
}