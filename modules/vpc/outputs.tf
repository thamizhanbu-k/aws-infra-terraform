# modules/vpc/outputs.tf
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "public_subnet_a_id" {
  description = "Public subnet AZ-a ID"
  value       = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  description = "Public subnet AZ-b ID"
  value       = aws_subnet.public_b.id
}

output "public_subnet_ids" {
  description = "List of both public subnet IDs"
  value       = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}