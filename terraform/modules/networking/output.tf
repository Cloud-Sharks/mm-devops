output "vpc_id" {
    value = aws_vpc.vpc.id
    description = ""
}

output "public_ids" {
    value = aws_subnet.subnet-public[*].id
    description = ""
}

output "private_ids" {
    value = aws_subnet.subnet-private[*].id
    description = ""
}