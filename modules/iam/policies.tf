data "aws_iam_policy_document" "get_all_authors_dynamo" {
  statement {
    sid = "dynamodb"

    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:ListBackups",
      "dynamodb:Query",
      "dynamodb:Scan"
    ]

    resources = [
      "${var.dynamo_db_authors_arn}",
    ]
  }
}

resource "aws_iam_policy" "get_all_authors" {
  name   = "${module.label.id}-get-all-authors"
  path   = "/"
  policy = data.aws_iam_policy_document.get_all_authors_dynamo.json
}

data "aws_iam_policy_document" "get_all_authors_cloudwatch" {
  statement {
    sid = "cloudwatch"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      var.get_all_authors_log_group_arn
    ]
  }
}

resource "aws_iam_policy" "get_all_authors_cloudwatch" {
  name   = "${module.label.id}-get-all-authors-cw"
  path   = "/"
  policy = data.aws_iam_policy_document.get_all_authors_cloudwatch.json
}