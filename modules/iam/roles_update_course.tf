data "aws_iam_policy_document" "update_course" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "update_course" {
  name               = "${module.label.id}-update-course"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.update_course.json
}

resource "aws_iam_role_policy_attachment" "update_course" {
  role       = aws_iam_role.update_course.name
  policy_arn = aws_iam_policy.update_course.arn
}

resource "aws_iam_role_policy_attachment" "update_course_cloudwatch" {
  role       = aws_iam_role.update_course.name
  policy_arn = aws_iam_policy.update_course_cloudwatch.arn
}