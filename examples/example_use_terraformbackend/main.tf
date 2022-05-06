terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.63"
    }
  }

  backend "s3" {
    bucket = "test-backend-terraform-state"
    key    = "terraform/layers/<env>"
    region = "eu-west-3"

    encrypt = true
    #kms_key_id = "" TODO: should we allow the creation of a custom kms key in the module?

    dynamodb_table = "test-backend-terraform-lock"

    profile = "default"
  }
}

provider "aws" {
  region = "eu-west-3"
}

### Declare your modules here ###
