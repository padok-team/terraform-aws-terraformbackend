output "s3_bucket_id" {
  value       = module.terraform_backend.s3_bucket_id
  description = "Name of the backend bucket"
}
output "dynamodb_table_id" {
  value       = module.terraform_backend.dynamodb_table_id
  description = "Name of the DynamoDB table"
}
