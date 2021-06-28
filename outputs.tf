output "ip-private" {
  value = [aws_instance.my_instances[*].private_ip]
}

output "eips" {
  value = [aws_eip.eips[*].address]
}

output "lb" {
  value = aws_lb.app-lb.dns_name
}