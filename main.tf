module "iam" {
  source       = "./modules/iam"
  context      = module.base_labels.context
  name         = "iam"
  dynamo_db_authors_arn = module.authors.arn
  dynamo_db_courses_arn = module.course.arn
  get_all_authors_log_group_arn = aws_cloudwatch_log_group.get_all_authors.arn
  get_all_courses_log_group_arn = aws_cloudwatch_log_group.get_all_courses.arn
}

module "lambda" {
  source       = "./modules/lambda"
  context      = module.base_labels.context
  name         = "lambda"
  dynamo_db_authors_name = module.authors.id
  dynamo_db_courses_name = module.course.id
  get_all_authors_role_arn = module.iam.get_all_authors_role_arn
  get_all_courses_role_arn = module.iam.get_all_courses_role_arn
}