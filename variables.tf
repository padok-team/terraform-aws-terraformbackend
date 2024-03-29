variable "bucket_name" {
  description = "Name of the bucket to be created for terraform backend"
  type        = string
  default     = null
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table to be created for terraform backend which is used as a terraform lock"
  type        = string
  default     = "terraform-state-lock-table"
}

variable "encryption" {
  type        = bool
  description = "Enable or disable encryption"
  default     = true
}
