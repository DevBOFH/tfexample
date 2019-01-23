// company Dev Heroku Environment
// main.tf

// Create Dev Private Space
module "space" {
  source            = "../modules/space"
  heroku_space_name = "company-dev-space"
  heroku_org_name   = "company"
  region            = "oregon"
}

// Only allow traffic from the company.com Office Egress
resource "heroku_space_inbound_ruleset" "default" {
  space = "company-dev-space"

  rule {
    action = "allow"
    source = "98.152.9.242/32"
  }
}

// Create Dev Apps in the space we just made
module "company-app-dev" {
  source      = "../modules/app"
  name        = "company-private-dev"
  space       = "company-dev-space"
  environment = "dev"
  region      = "oregon"

  buildpacks = [
    "https://github.com/DataDog/heroku-buildpack-datadog.git",
    "https://github.com/heroku/heroku-buildpack-pgbouncer.git",
    "https://github.com/andrewychoi/heroku-buildpack-scipy",
    "https://github.com/dscout/wkhtmltopdf-buildpack.git",
  ]
}

// Attach Addons to the Dev App
module "addon-cloudamqp" {
  source = "../modules/addon"
  name   = "cloudamqp"
  plan   = "cloudamqp:tiger"
  app    = "company-private-dev"
}

module "addon-heroku-postgresql" {
  source = "../modules/addon"
  name   = "heroku-postgresql"
  plan   = "heroku-postgresql:standard-2"
  app    = "company-private-dev"
}

module "addon-memcachier" {
  source = "../modules/addon"
  name   = "memcachier"
  plan   = "memcachier:dev"
  app    = "company-private-dev"
}

module "addon-newrelic" {
  source = "../modules/addon"
  name   = "newrelic"
  plan   = "newrelic:wayne"
  app    = "company-private-dev"
}

module "addon-scheduler" {
  source = "../modules/addon"
  name   = "scheduler"
  plan   = "scheduler:standard"
  app    = "company-private-dev"
}

// Log Drains
resource "heroku_drain" "datadog" {
  app = "company-private-dev"
  url = "https://http-intake.logs.datadoghq.com/v1/input/APIKEY?ddsource=heroku&service=company-private-dev&host=company-private-dev"
}
