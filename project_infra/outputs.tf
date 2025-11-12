output "instance_public_ips" {
  description = "Public IPs of all created instances"
  value = {
    for name, instance in aws_instance.servers :
    name => instance.public_ip
  }
}

output "security_group_id" {
  value       = aws_security_group.allow_all.id
  description = "ID of the allow-all security group"
}

output "vpc_id" {
  value       = aws_vpc.main_vpc.id
  description = "ID of the created VPC"
}
output "subnet_id" {
  value       = aws_subnet.main_subnet.id
  description = "ID of the created Subnet"
}
