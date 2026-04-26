# modules/vpc/variables.tf
variable "project_name" {
  description = "Project name for resource tagging"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_a" {
  description = "Public subnet CIDR for AZ-a"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_b" {
  description = "Public subnet CIDR for AZ-b"
  type        = string
  default     = "10.0.2.0/24"
}

variable "region" {
  description = "AWS region"
  type        = string
}