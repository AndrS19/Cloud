data "aws_iam_policy_document" "get_one_course_dynamo" {
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
      "${var.dynamo_db_courses_arn}",
    ]
  }
}

resource "aws_iam_policy" "get_one_course" {
  name   = "${module.label.id}-get-one-course"
  path   = "/"
  policy = data.aws_iam_policy_document.get_one_course_dynamo.json
}

data "aws_iam_policy_document" "get_one_course_cloudwatch" {
  statement {
    sid = "cloudwatch"

    actions = [
      "logs:CreateLogStream",    
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents"
    ]

    resources = [
      var.cw_log_group_get_one_course_arn,
      "${var.cw_log_group_get_one_course_arn}:*"
    ]
  }
}

resource "aws_iam_policy" "get_one_course_cloudwatch" {
  name   = "${module.label.id}-get-one-course-cw"
  path   = "/"
  policy = data.aws_iam_policy_document.get_one_course_cloudwatch.json
}