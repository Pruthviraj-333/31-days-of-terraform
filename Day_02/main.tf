# ==============================================================================
# Day 02: Terraform Providers & Version Constraints
# 31 Days of Terraform (AWS)
# ==============================================================================

terraform {
  # Terraform Core Version Constraint
  required_version = ">= 1.5.0"

  # Required Providers Definition
  required_providers {
    # HashiCorp AWS Provider
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Allows version >= 5.0 and < 6.0 (pessimistic constraint)
    }

    # HashiCorp Random Provider (Example of multiple provider declaration)
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

# ------------------------------------------------------------------------------
# Provider Configuration
# ------------------------------------------------------------------------------

# AWS Provider configuration for us-east-1 region
provider "aws" {
  region = "us-east-1"

  # Default tags applied to all resources managed by this provider
  default_tags {
    tags = {
      Environment = "Learning"
      ManagedBy   = "Terraform"
      Day         = "Day_02"
    }
  }
}

# Example Random String resource to test multi-provider setup
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}
