resource "random_pet" "bucket_pet" {}

locals {
  bucket_name = var.bucket_name != null ? var.bucket_name : "terraform-state-bucket-${random_pet.bucket_pet.id}"
}

module "ssm_logging_bucket" {
  source = "git@github.com:padok-team/terraform-aws-s3?ref=v0.1.0"
  name   = local.bucket_name
}


resource "aws_dynamodb_table" "this" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
