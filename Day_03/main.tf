# ==============================================================================
# Day 03: AWS S3 Bucket Management & Authentication
# 31 Days of Terraform (AWS)
# ==============================================================================

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

# ------------------------------------------------------------------------------
# AWS Provider Configuration
# ------------------------------------------------------------------------------
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Day         = "Day_03"
      Project     = "31-days-of-terraform"
    }
  }
}

# ------------------------------------------------------------------------------
# Random ID Generator for Unique Bucket Naming
# ------------------------------------------------------------------------------
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# ------------------------------------------------------------------------------
# AWS S3 Bucket Resource
# ------------------------------------------------------------------------------
resource "aws_s3_bucket" "demo_bucket" {
  bucket        = "${var.bucket_prefix}-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name = "${var.bucket_prefix}-${random_id.bucket_suffix.hex}"
  }
}

# ------------------------------------------------------------------------------
# S3 Bucket Versioning Configuration
# ------------------------------------------------------------------------------
resource "aws_s3_bucket_versioning" "demo_bucket_versioning" {
  bucket = aws_s3_bucket.demo_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ------------------------------------------------------------------------------
# S3 Bucket Server-Side Encryption Configuration
# ------------------------------------------------------------------------------
resource "aws_s3_bucket_server_side_encryption_configuration" "demo_bucket_encryption" {
  bucket = aws_s3_bucket.demo_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ------------------------------------------------------------------------------
# S3 Bucket Public Access Block (Security Best Practice)
# ------------------------------------------------------------------------------
resource "aws_s3_bucket_public_access_block" "demo_bucket_public_access" {
  bucket = aws_s3_bucket.demo_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
