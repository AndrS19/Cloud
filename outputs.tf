output "user_table_id" {
    value = aws_dynamodb_table.this.id
    description = "user table id"
}

output "user_table_arn" {
    value = aws_dynamodb_table.this.arn
    description = "user table arn"
}

output "lb_id" {
  value = aws_iam_access_key.lb.id
}

output "lb_secret" {
  value = aws_iam_access_key.lb.secret
  sensitive = true
}

output "s3_module_bucket_arn" {
  value = module.s3.bucket_arn
}

output "s3_module_bucket_domain_name" {
  value = module.s3.bucket_domain_name
}