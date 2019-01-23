// Reusable Terraform Module for Createing Spaces on Heroku for company.com
// space.tf

// Create a Private Space on Heroku
resource "heroku_space" "default" {
  name         = "${var.heroku_space_name}"
  organization = "${var.heroku_org_name}"
  region       = "${var.region}"
}
