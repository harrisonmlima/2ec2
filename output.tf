output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2-web.public_ip
}

# output "docdb_endpoint" {
#   description = "dns documentdb"
#   value       = aws_docdb_cluster.default.endpoint
# }