terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.2.0"
        }
    }

    backend "s3" {
        bucket  = "mm-aline-s3"
        key     = "tfstate-dev"
        region  = "us-east-1"
        profile = "default"
    }

    required_version = ">= 0.14.9"
}