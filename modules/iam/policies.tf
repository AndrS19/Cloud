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
      #"${var.dynamo_db_authors_arn}/*",
    ]
  }
}

resource "aws_iam_policy" "get_all_authors" {
  name   = "${module.label.id}-get-all-authors"
  path   = "/"
  policy = data.aws_iam_policy_document.get_all_authors_dynamo.json
}