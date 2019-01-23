// variables.tf

variable "name" {
  description = "The name of the app you want to create"
}

variable "environment" {
  description = "The environment the app is in"
}

variable "space" {
  description = "The space you want to create the app in"
}

variable "buildpacks" {
  type        = "list"
  description = "A list of buildpacks you want to install with the app"
}
