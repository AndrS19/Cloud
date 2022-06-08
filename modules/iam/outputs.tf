output "get_all_authors_role_arn" {
    value = aws_iam_role.get_all_authors.arn
}

output "get_all_courses_role_arn" {
    value = aws_iam_role.get_all_courses.arn
}

output "get_one_course_role_arn" {
    value = aws_iam_role.get_one_course.arn
}

output "save_course_role_arn" {
    value = aws_iam_role.save_course.arn
}

output "update_course_role_arn" {
    value = aws_iam_role.update_course.arn
}

output "delete_course_role_arn" {
    value = aws_iam_role.delete_course.arn
}