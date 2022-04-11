resource "aws_secretsmanager_secret" "aline-config" {
    name = "network-config"
}

locals {
    network-info = {
        vpc_id = var.vpc_id
        private_id_1 = var.private_ids[0]
        private_id_2 = var.private_ids[1]
        public_id_1 = var.public_ids[0]
        public_id_2 = var.public_ids[1]
    }
}
resource "aws_secretsmanager_secret_version" "sversion" {
    secret_id = aws_secretsmanager_secret.aline-config.id
    secret_string = jsonencode(local.network-info)
}

# Import the AWS secrets created previously using arn
data "aws_secretsmanager_secret" "aline-config" {
    arn = aws_secretsmanager_secret.aline-config.arn
}

# Importing the AWS secret version created perviously using arn
data "aws_secretsmanager_secret_version" "creds" {
    secret_id = data.aws_secretsmanager_secret.aline-config.arn
}

locals {
    network_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}