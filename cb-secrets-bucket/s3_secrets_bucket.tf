provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "cb_secrets_bucket" {
  bucket = "cb-secrets-bucket-042618"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  logging {
    target_bucket = "cb-logging-bucket-042618"
    target_prefix = "log/secrets"
  }
}
