# outputs.tf
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "alb_dns_name" {
  description = "ALB DNS name — use this to access your app"
  value       = aws_lb.app.dns_name
}

output "app_url" {
  description = "Application URL via ALB"
  value       = "http://${aws_lb.app.dns_name}/health"
}

output "asg_name" {
  description = "Auto Scaling Group name"
  value       = aws_autoscaling_group.app.name
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.app.arn
}

output "subnet_ids" {
  description = "Public subnet IDs (2 AZs)"
  value       = module.vpc.public_subnet_ids
}