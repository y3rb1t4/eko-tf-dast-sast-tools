terraform {
  backend "s3" {
    bucket         = "iac-tf-bucket-s3"
    region         = "us-east-1"
    encrypt        = true
    key            = "lambdatf/deploy.tfstate"
    role_arn       = "arn:aws:iam::459137896070:role/training-gitlab-deploy-role"
    #shared_credentials_file = "~/.aws/credentials"
  }
}