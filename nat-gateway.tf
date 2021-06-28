# ------- PUBLIC NAT GATEWAY ----------
# You create a public NAT gateway in a public subnet and must 
# associate an elastic IP address with the NAT gateway at creation
resource "aws_eip" "eips" {
  count      = length(var.azs)
  vpc        = true
  depends_on = [aws_internet_gateway.i-gateway]
}

resource "aws_nat_gateway" "nat-gtw" {
  count             = length(var.pub-subnets)
  allocation_id     = aws_eip.eips[count.index].id
  subnet_id         = aws_subnet.pub-subnets[count.index].id
  connectivity_type = "public"
  depends_on        = [aws_internet_gateway.i-gateway]

  tags = {
    Name = "nat-gwt-${count.index}"
  }
}