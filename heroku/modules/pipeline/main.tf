// Find Heroku pipeline docs here: https://www.terraform.io/docs/providers/heroku/r/pipeline
// pipeline.tf

// Createa a Heroku Pipeline
resource "heroku_pipeline" "default" {
  name = "${var.name}"
}
