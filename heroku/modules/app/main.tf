// Module to creating apps on company.com's Heroku Cloud
// main.tf

resource "heroku_app" "default" {
  name   = "${var.name}"
  region = "${var.region}"
  space  = "${var.space}"

  config_vars {
    APP_ENV = "${var.environment}"
  }

  buildpacks = "${var.buildpacks}"
}
