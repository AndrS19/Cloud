data "aws_iam_policy_document" "save_course" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "save_course" {
  name               = "${module.label.id}-save-course"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.save_course.json
}

resource "aws_iam_role_policy_attachment" "save_course" {
  role       = aws_iam_role.save_course.name
  policy_arn = aws_iam_policy.save_course.arn
}

resource "aws_iam_role_policy_attachment" "save_course_cloudwatch" {
  role       = aws_iam_role.save_course.name
  policy_arn = aws_iam_policy.save_course_cloudwatch.arn
}