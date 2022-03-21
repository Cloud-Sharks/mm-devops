variable "bucket_name" {
    type = string
    default = ""
    description = "Name of the S3 bucket"
}

variable "acl_value" {
    type = string
    default = "private"
    description = "Value"
}