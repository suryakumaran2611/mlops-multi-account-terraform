terraform {
  required_version = "1.5.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.15.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "mlops"
      ManagedBy   = "terraform"
      Repository  = "mlops-multi-account-terraform"
      Layer       = "base-infrastructure"
    }

  }
}
