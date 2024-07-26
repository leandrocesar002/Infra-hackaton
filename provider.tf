terraform {
  backend "s3" {
    bucket = "terraform-fiap-tech-lc-lr" # example: terraform-tfstates
    key    = "sonarqube/terraform.tfstate"
    region = "us-east-1"  # example: us-east-1 (região escolhida na criação do bucket)
  }
}

provider "aws" {
  region = var.regionDefault

  default_tags {
    tags = var.tags
  }
}