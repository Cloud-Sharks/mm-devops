variable "vpc_id" {
    default = ""
    description = ""
    type = string
}

variable "public_ids" {
    default = []
    description = ""
    type = list(string)
}

variable "private_ids" {
    default = []
    description = ""
    type = list(string)
}