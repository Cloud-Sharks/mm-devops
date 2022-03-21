variable "region" {
  type = string
  default = ""
  description = "Region of the AWS account"
}

variable "environment" {
  type = string
  default = ""
  description = "Environment"
}

variable "owner" {
  type = string
  default = ""
  description = "Owner of the environment"
}

variable "vpc_cidr" {
  type = string
  default = ""
  description = "IPv4 CIDR block to be assigned to the VPC"
}

variable "public_subnet" {
  type = list(string)
  default = []
  description = "List of public CIDR blocks within the VPC CIDR"
}

variable "private_subnet" {
  type = list(string)
  default = []
  description = "List of private CIDR blocks within the VPC CIDR"
}

variable "azs" {
  type = list(string)
  default = []
  description = "Availability zones"
}

variable "bucket_name" {
  type = string
  default = ""
  description = "Name of the S3 bucket"
}

variable "acl_value" {
  default = "private"
  description = "Name of the S3 bucket"
}