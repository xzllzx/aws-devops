# Terraform backend
terraform {
  backend "s3" {
    bucket = "aws-devops-zx"
    key    = "nginx.tfstate"
    region = "us-east-1"
  }
}