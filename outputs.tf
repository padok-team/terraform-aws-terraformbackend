output "s3_bucket_id" {
  description = "Name of the backend bucket"
  value       = aws_s3_bucket.this.id
}

output "dynamodb_table_id" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.this.id
}

output "aws_kms_key_id" {
  value = aws_kms_key.terraform-bucket-key.id
}
