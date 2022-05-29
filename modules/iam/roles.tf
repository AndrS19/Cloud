data "aws_iam_policy_document" "lambda_read" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_read" {
  name               = "${module.label.id}-lambda-read"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.lambda_read.json
}

resource "aws_iam_role_policy_attachment" "lambda_read" {
  role       = aws_iam_role.lambda_read.name
  policy_arn = aws_iam_policy.s3_backend.arn
}

resource "aws_iam_role_policy" "lambda_read_inline" {
  name = "${module.label.id}-lambda-read-inline"
  role = aws_iam_role.lambda_read.name
  policy = data.aws_iam_policy_document.s3_backend.json
}
