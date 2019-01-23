// variables.tf

variable "heroku_space_name" {
  description = "The name of the private space you want to create"
}

variable "organization" {
  description = "The name of the heroku organization you want to create the private space in"
}

variable "region" {
  description = "The region you want to create the private space in. This should always be oregon for now."
}
