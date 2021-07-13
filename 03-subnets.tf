# PUBLIC SUBNETS
resource "aws_subnet" "pub-subnets" {
  vpc_id                  = aws_vpc.my-vpc.id
  count                   = length(var.pub-subnets)
  availability_zone       = element(var.azs, count.index)
  cidr_block              = element(var.pub-subnets, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-subnet-${count.index}"
  }
}

# PRIVATE SUBNETS
resource "aws_subnet" "priv-subnets" {
  vpc_id                  = aws_vpc.my-vpc.id
  count                   = length(var.priv-subnets)
  availability_zone       = element(var.azs, count.index)
  cidr_block              = element(var.priv-subnets, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "priv-subnet-${count.index}"
  }
}