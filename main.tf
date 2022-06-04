module "iam" {
  source       = "./modules/iam"
  context      = module.base_labels.context
  name         = "iam"
  dynamo_db_authors_arn = module.authors.arn
  dynamo_db_course_arn = module.course.arn
}

module "lambda" {
  source       = "./modules/lambda"
  context      = module.base_labels.context
  name         = "lambda"
  dynamo_db_authors_name = module.authors.id
  get_all_authors_role_arn = module.iam.get_all_authors_role_arn
}