// Heroku Addon Module for company.com
// main.tf

resource "heroku_addon" "default" {
  app  = "${var.app}"
  plan = "${var.plan}"
}
