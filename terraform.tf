terraform {
  backend "s3" {}
}

provider "heroku" {
  email = "${var.heroku_email}"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "staging" {
  name = "${var.heroku_app_name}-staging"
  region = "${var.heroku_app_region}"
}

resource "heroku_addon" "staging-database" {
  app = "${heroku_app.staging.name}"
  plan = "${var.heroku_db_plan}"
}

resource "heroku_app" "production" {
  name = "${var.heroku_app_name}-prod"
  region = "${var.heroku_app_region}"
}

resource "heroku_addon" "production-database" {
  app = "${heroku_app.production.name}"
  plan = "${var.heroku_db_plan}"
}

# Create a Heroku pipeline
resource "heroku_pipeline" "test-app" {
  name = "${var.heroku_app_name}"
}

# Couple apps to different pipeline stages
resource "heroku_pipeline_coupling" "staging" {
  app = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.test-app.id}"
  stage = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.test-app.id}"
  stage = "production"
}
