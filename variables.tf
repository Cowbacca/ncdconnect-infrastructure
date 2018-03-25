# Authentication for the Heroku provider - we use this access
# key in order to be able to create a new Heroku application
# and provision the addon
variable "heroku_email" {}
variable "heroku_api_key" {}

# Heroku app settings
# This is the name of the Heroku application that we will create
# This needs to be unique (no to accounts can have the same name)
variable "heroku_app_name" {}
variable "heroku_app_region" {
  default = "eu"
}
# The application needs to provision a database. This the plan level
# for the basic Heroku Postgress database
variable "heroku_db_plan" {
  default = "heroku-postgresql:hobby-dev"
}
