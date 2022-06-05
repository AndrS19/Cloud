module "iam" {
  source       = "./modules/iam"
  context      = module.base_labels.context
  name         = "iam"
  dynamo_db_authors_arn = module.authors.arn
  dynamo_db_courses_arn = module.course.arn
  cw_log_group_get_all_authors_arn = module.lambda.cw_log_group_get_all_authors_arn
  cw_log_group_get_all_courses_arn = module.lambda.cw_log_group_get_all_courses_arn
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

module "frontend" {
  source = "./modules/s3-cloudfront-website"
  context = module.base_labels.context
  name = "frontend"
  domain_name = "dev.cloudtechnologies.andrii.lpnu.ua"
  website_cloudfront_min_ttl = "300"
  website_cloudfront_default_ttl = "300"
  website_cloudfront_max_ttl = "300"
}