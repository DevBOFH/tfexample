// variables.tf

variable "name" {
  description = "The name of the addon you want to install"
}

variable "plan" {
  description = "The plan you want to subscribe to"
}

variable "app" {
  description = "The app you want to install the addon to"
}
