variable "bucket_name" {
  type        = string
  description = "Name of the bucket to be created for terraform backend"
  default     = "terraform-state-bucket"
}

variable "dynamodb_table_name" {
  type        = string
  description = "Name of the DynamoDB table to be created for terraform backend"
  default     = "terraform-state-lock-table"
}
