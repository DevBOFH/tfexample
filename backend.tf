terraform {
  required_version = ">= 0.11.11"

  backend "s3" {
    bucket         = "company-terraform-remote-state-${environment}"
    key            = "terraform/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
