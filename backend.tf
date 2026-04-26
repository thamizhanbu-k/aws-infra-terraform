# backend.tf
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "anbu-terraform-state"
    key    = "network-health-monitor/terraform.tfstate"
    region = "ap-south-1"
  }
}