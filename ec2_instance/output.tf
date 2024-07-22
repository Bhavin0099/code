output "task2_SG_id" {
  value = aws_security_group.task2_security_group.id
  description = "task2 security group id"
}

output "task2_server_ip" {
  value = aws_instance.task2_private_instance.private_ip
  description = "task2 server's private ip" 
}

output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "subnet_id" {
  value = data.aws_subnet.selected.id
}
