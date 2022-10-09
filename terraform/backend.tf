terraform {
  backend "s3" {
    bucket         = "iac-tf-bucket-s3"
    region         = "us-east-1"
    encrypt        = true
    key            = "lambdatf/deploy.tfstate"
    role_arn       = "arn:aws:iam::748829426227:role/negri"
    #shared_credentials_file = "~/.aws/credentials"
  }
}