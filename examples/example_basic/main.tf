# Create a simple terraform s3 backend
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

module "terraform_backend" {
  source = "../.."
}
