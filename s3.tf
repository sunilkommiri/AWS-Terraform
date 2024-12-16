provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  # Replace with a unique bucket name
  acl    = "private"  # Set the bucket ACL (private, public-read, etc.)

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}
