provider "aws" {
  region = "eu-west-2"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "cfl-terraform-test"
    key    = "platform.tfstate"
    region = "eu-west-2"
  }
}
resource "random_uuid" "randomid" {}

resource "aws_instance" "Dev" {
    ami = "ami-0dbec48abfe298cab"
    instance_type = "t2.micro"
    tags = {
      name = "Dev3"
    }
    }
