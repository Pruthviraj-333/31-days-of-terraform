# ==============================================================================
# Day 03: Variables Definition
# 31 Days of Terraform (AWS)
# ==============================================================================

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region for deploying resources"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Target deployment environment (e.g. dev, staging, prod)"
}

variable "bucket_prefix" {
  type        = string
  default     = "my-tf-s3-bucket"
  description = "Prefix for generating globally unique S3 bucket names"
}
