resource "aws_internet_gateway" "i-gateway" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "my-igtw"
  }
}