data "aws_iam_policy_document" "delete_course" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "delete_course" {
  name               = "${module.label.id}-delete-course"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.delete_course.json
}

resource "aws_iam_role_policy_attachment" "delete_course" {
  role       = aws_iam_role.delete_course.name
  policy_arn = aws_iam_policy.delete_course.arn
}

resource "aws_iam_role_policy_attachment" "delete_course_cloudwatch" {
  role       = aws_iam_role.delete_course.name
  policy_arn = aws_iam_policy.delete_course_cloudwatch.arn
}