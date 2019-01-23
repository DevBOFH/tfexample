// company.com Infrasturcture

// Configure the Heroku provider
provider "heroku" {}

// Dev Environment
module "company-heroku-dev" {
  source = "./dev"
}

// Stg Environment
//module "company-heroku-stg" {
//  source = "./stg"
//}
//
// Prod Environment
//module "company-heroku-dev" {
//  source = "./prod"
//}

