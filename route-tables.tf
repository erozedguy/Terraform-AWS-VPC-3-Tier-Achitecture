# TABLE FOR PUBLIC SUBNETS
resource "aws_route_table" "rt-pub" {
  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_route" "pub-route" {
  route_table_id         = aws_route_table.rt-pub.id
  destination_cidr_block = "0.0.0.0/0" #all IPV4 addresses
  gateway_id             = aws_internet_gateway.i-gateway.id
}

resource "aws_route_table_association" "as-pub" {
  count          = length(var.pub-subnets)
  subnet_id      = aws_subnet.pub-subnets[count.index].id
  route_table_id = aws_route_table.rt-pub.id
}

# TABLE FOR PRIVATE SUBNETS
resource "aws_route_table" "rt-priv" {
  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_route" "priv-route" {
  route_table_id          = aws_route_table.rt-priv.id
  destination_cidr_block  = "0.0.0.0/0" #all IPV4 addresses
  nat_gateway_id          = aws_nat_gateway.nat-gtw[count.index].id 
}

resource "aws_route_table_association" "as-priv" {
  count          = length(var.azs)
  subnet_id      = aws_subnet.priv-subnets[count.index].id
  route_table_id = aws_route_table.rt-priv.id
}
