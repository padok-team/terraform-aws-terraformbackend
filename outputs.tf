output "bucket" {
  value       = aws_s3_bucket.terraform.id
  description = "Name of the backend bucket"
}

output "dynamodb_table" {
  value       = aws_dynamodb_table.terraform.id
  description = "Name of the DynamoDB table"
}
