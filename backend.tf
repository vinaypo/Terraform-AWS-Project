terraform {
    backend "s3" {
    bucket  = "vinaypo-backend"
    key = "my/terraform.tfstate"
    region = "us-east-1"
  
  }
}