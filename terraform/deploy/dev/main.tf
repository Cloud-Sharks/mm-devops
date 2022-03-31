provider "aws" {
    profile         = "default"
    region          = var.region
    alias           = "main"

    default_tags {
        tags = {
            Environment = var.environment
            Owner       = var.owner
        }
    }
}

provider "aws" {
    region          = "us-east-1"
    alias           = "bucket_region"
}

module "network" {
    providers = {
        aws = aws.main
    }

    source          = "../../modules/networking"
    vpc_cidr        = var.vpc_cidr
    public_subnet   = var.public_subnet
    private_subnet  = var.private_subnet
    azs             = var.azs
}

module "security_groups" {
    providers = {
        aws = aws.main
    }

    source          = "../../modules/security_groups"
    vpc_id          = module.network.vpc_id
}

module "secret" {
    providers = {
        aws = aws.main
    }

    source      = "../../modules/secrets"
    vpc_id      = module.network.vpc_id
    public_ids  = module.network.public_ids
    private_ids = module.network.private_ids
}

module "s3" {
    providers = {
        aws = aws.bucket_region
    }
    
    source          = "../../modules/s3"
    bucket_name     = var.bucket_name
}