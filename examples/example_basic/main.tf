# Create a simple terraform s3 backend

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.63.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

module "terraform_backend" {
  source              = "../.."
  bucket_name         = "test-backend-terraform-state"
  dynamodb_table_name = "test-backend-terraform-lock"
}
