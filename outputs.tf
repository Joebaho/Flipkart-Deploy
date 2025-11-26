output "public_ips" {
  description = "Public IPs of the servers"
  value       = [for instance in aws_instance.web : instance.public_ip]
}
output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = aws_lb.web_lb.dns_name
}

