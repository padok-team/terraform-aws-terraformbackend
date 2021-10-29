output "bucket" {
  value       = module.terraform_backend.bucket
  description = "Name of the backend bucket"
}
output "dynamodb_table" {
  value       = module.terraform_backend.dynamodb_table
  description = "Name of the DynamoDB table"
}
