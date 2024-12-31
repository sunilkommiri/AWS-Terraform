# Define the AWS provider
provider "aws" {
  region = "us-east-1" # Change to your desired region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345" # Replace with a globally unique name
  acl    = "private" / "public"

  # Enable versioning
  versioning {
    enabled = true / false 
  }

  # Enable server-side encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Environment = "Dev"
    Project     = "Terraform-S3"
  }
}

# Optional: S3 bucket policy for public access (if required)
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:GetObject"
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
        Principal = "*"
      }
    ]
  })
}

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

# Output the bucket ARN
output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}
