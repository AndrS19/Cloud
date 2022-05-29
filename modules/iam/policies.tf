data "aws_iam_policy_document" "s3_backend" {
  statement {
    sid = "backendBucket"

    actions = [
        "s3:DeleteObject",
        "s3:DeleteObjectTagging",
        "s3:DeleteObjectVersion",
        "s3:GetBucketLocation",
        "s3:ListAllMyBuckets",
        "s3:PutObject"
    ]

    resources = [
        "${var.backend_bucket_arn}",
        "${var.backend_bucket_arn}/*"
    ]
  }
}

resource "aws_iam_policy" "s3_backend" {
  name   = "${module.label.id}-s3-backend"
  path   = "/"
  policy = data.aws_iam_policy_document.s3_backend.json
}