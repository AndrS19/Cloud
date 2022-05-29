terraform {
  backend "s3" {
    bucket = "151575470896-terraform-tfstate-2022"
    key    = "dev/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-tfstate-lock-2022"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.14.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}