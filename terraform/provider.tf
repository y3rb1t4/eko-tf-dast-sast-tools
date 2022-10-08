provider "aws" {
  region                  = var.aws_region
  # shared_credentials_file = "~/.aws/credentials"
  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/${var.aws_role_name}"
  }
}