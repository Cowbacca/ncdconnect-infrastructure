heroku_app_name = "ncdconnect-backend"
heroku_email = "angus@dashery.co.uk"

terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket = "terragrunt-ncdconnect"
      key = "${path_relative_to_include()}/terraform.tfstate"
      region = "eu-west-1"
      encrypt = true
      dynamodb_table = "terragrunt-ncdconnect"
    }
  }
}
