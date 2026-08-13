# ==============================================================================
# Day 03: Outputs Definition
# 31 Days of Terraform (AWS)
# ==============================================================================

output "s3_bucket_name" {
  description = "The globally unique name of the S3 bucket created by Terraform"
  value       = aws_s3_bucket.demo_bucket.id
}

output "s3_bucket_arn" {
  description = "The Amazon Resource Name (ARN) of the S3 bucket"
  value       = aws_s3_bucket.demo_bucket.arn
}

output "s3_bucket_region" {
  description = "The AWS Region where the S3 bucket resides"
  value       = aws_s3_bucket.demo_bucket.region
}

output "s3_bucket_domain_name" {
  description = "The bucket domain name for accessing objects"
  value       = aws_s3_bucket.demo_bucket.bucket_domain_name
}
