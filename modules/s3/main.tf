module "label" {
  source = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name = var.bucket_name
}

resource "aws_s3_bucket" "this" {
  #bucket = "my-tf-test-bucket-151575470896"
  bucket = module.label.id

  tags = {
    Name = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}