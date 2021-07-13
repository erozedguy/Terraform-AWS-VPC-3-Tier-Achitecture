resource "aws_instance" "my_instances" {
  count             = length(var.azs)
  ami               = "ami-0aeeebd8d2ab47354"
  instance_type     = "t2.micro"
  availability_zone = element(var.azs, count.index)
  subnet_id         = aws_subnet.priv-subnets[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data         = file("http.sh")

  tags = {
    Name = "instance-${element(var.azs, count.index)}"
  }
}