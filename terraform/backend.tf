terraform {
  backend "s3" {
    bucket         = "iac-tf-bucket-s34"
    region         = "us-east-1"
    encrypt        = true
    key            = "lambdatf/deploy.tfstate"
    role_arn       = "arn:aws:iam::748829426227:role/training-gitlab-deploy-role" #test
    #shared_credentials_file = "~/.aws/credentials"
  }
}