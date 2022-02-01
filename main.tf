resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.terraform-bucket-key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

data "aws_iam_policy_document" "multi-accounts-kms-policy" {
  statement {
    sid = "multi-accounts-kms-policy"

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]

    resources = [
      "*",
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::207772818783:root"]
    }
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::691229541527:root"]
    }
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::187163521639:root"]
    }
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::707704181571:root"]
    }
  }
}

resource "aws_kms_key" "terraform-bucket-key" {
  description         = "KMS key"
  enable_key_rotation = true
  policy              = data.aws_iam_policy_document.multi-accounts-kms-policy.json
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
