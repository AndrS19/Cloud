# module "label" {
#   source = "cloudposse/label/null"
#   version = "0.25.0"
#   context = var.context
# }

# resource "aws_s3_bucket" "this" {
#   bucket = module.label.id
#   tags = module.label.tags
# }

# resource "aws_s3_bucket_acl" "this" {
#   bucket = aws_s3_bucket.this.id
#   acl    = "private"
# }

locals {
  domain_name = module.labels.stage == "prod" ? var.domain_name : "${var.name}.${var.domain_name}"
}

module "labels" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.25.0"
  context = var.context
  name = var.name
}

resource "aws_s3_bucket" "this" {
  bucket = local.domain_name
  # acl = "private"
  force_destroy = true
  tags = module.labels.tags
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "${aws_s3_bucket.this.arn}/*",
    ]
    principals {
      type = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.default.iam_arn,
      ]
    }
  }
}

resource "aws_cloudfront_distribution" "this" {
  enabled = true
  wait_for_deployment = false
  price_class = "PriceClass_100"
  default_root_object = "index.html"

  default_cache_behavior {
    compress = true
    target_origin_id = var.name
    viewer_protocol_policy = "allow-all"

    min_ttl = var.website_cloudfront_min_ttl
    default_ttl = var.website_cloudfront_default_ttl
    max_ttl = var.website_cloudfront_max_ttl

    allowed_methods = [
      "DELETE",
      "GET",
      "HEAD",
      "OPTIONS",
      "PATCH",
      "POST",
      "PUT",
    ]

    cached_methods = [
      "GET",
      "HEAD",
    ]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }
  
  origin {
    domain_name = aws_s3_bucket.this.bucket_regional_domain_name
    origin_id = var.name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.default.cloudfront_access_identity_path
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = ["UA"]
    }
  }

  custom_error_response {
    error_caching_min_ttl = "0"
    error_code = "400"
    response_code = "200"
    response_page_path = "/index.html"
  }

  custom_error_response {
    error_caching_min_ttl = "0"
    error_code = "404"
    response_code = "200"
    response_page_path = "/index.html"
  }

  custom_error_response {
    error_caching_min_ttl = "0"
    error_code = "403"
    response_code = "200"
    response_page_path = "/index.html"
  }
}

resource "aws_cloudfront_origin_access_identity" "default" {
  comment = module.labels.id
}