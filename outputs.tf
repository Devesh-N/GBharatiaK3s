output "master_instance_public_ip" {
  value = aws_instance.master.public_ip
}

output "agent_instance_public_ips" {
  value = [for instance in aws_instance.agent : instance.public_ip]
}
