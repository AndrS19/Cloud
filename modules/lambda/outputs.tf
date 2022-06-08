output "cw_log_group_get_all_authors_arn" {
    value = aws_cloudwatch_log_group.get_all_authors.arn
}

output "cw_log_group_get_all_courses_arn" {
    value = aws_cloudwatch_log_group.get_all_courses.arn
}

output "cw_log_group_get_one_course_arn" {
    value = aws_cloudwatch_log_group.get_one_course.arn
}

output "cw_log_group_save_course_arn" {
    value = aws_cloudwatch_log_group.save_course.arn
}

output "cw_log_group_update_course_arn" {
    value = aws_cloudwatch_log_group.update_course.arn
}

output "cw_log_group_delete_course_arn" {
    value = aws_cloudwatch_log_group.delete_course.arn
}

output "get_all_authors_lambda_function_name" {
    value = module.lambda_function_get_all_authors.lambda_function_name
}

output "get_all_courses_lambda_function_name" {
    value = module.lambda_function_get_all_courses.lambda_function_name
}

output "get_one_course_lambda_function_name" {
    value = module.lambda_function_get_one_course.lambda_function_name
}

output "save_course_lambda_function_name" {
    value = module.lambda_function_save_course.lambda_function_name
}

output "update_course_lambda_function_name" {
    value = module.lambda_function_update_course.lambda_function_name
}

output "delete_course_lambda_function_name" {
    value = module.lambda_function_delete_course.lambda_function_name
}

output "get_all_courses_lambda_cloudwatch_log_group_name" {
  value = module.lambda_function_get_all_courses.lambda_function_name
}

output "get_all_authors_lambda_cloudwatch_log_group_name" {
  value = module.lambda_function_get_all_authors.lambda_function_name
}

output "get_one_course_lambda_cloudwatch_log_group_name" {
  value = module.lambda_function_get_one_course.lambda_function_name
}

output "save_course_lambda_cloudwatch_log_group_name" {
  value = module.lambda_function_save_course.lambda_function_name
}

output "update_course_lambda_cloudwatch_log_group_name" {
  value = module.lambda_function_update_course.lambda_function_name
}

output "delete_course_lambda_cloudwatch_log_group_name" {
  value = module.lambda_function_delete_course.lambda_function_name
}

output "get_all_authors_invoke_arn" {
  value = module.lambda_function_get_all_authors.lambda_function_invoke_arn
}

output "get_all_courses_invoke_arn" {
  value = module.lambda_function_get_all_courses.lambda_function_invoke_arn
}

output "get_one_course_invoke_arn" {
  value = module.lambda_function_get_one_course.lambda_function_invoke_arn
}

output "save_course_invoke_arn" {
  value = module.lambda_function_save_course.lambda_function_invoke_arn
}

output "update_course_invoke_arn" {
  value = module.lambda_function_update_course.lambda_function_invoke_arn
}

output "delete_course_invoke_arn" {
  value = module.lambda_function_delete_course.lambda_function_invoke_arn
}