# NCD Connect Infrastructure

The infrastructure for NCD Connect is controlled by Terraform via Terragrunt.

## Prerequisites

Terraform [(download available here)](https://www.terraform.io/downloads.html)

Terragrunt [(download available here)](https://github.com/gruntwork-io/terragrunt#install-terragrunt)

## Setup

Copy the example secret tfvars file and fill it in.
`cp secret.auto.tfvars.example secret.auto.tfvars`

You will need AWS credentials that have permission to access the S3 bucket and DynamoDB table configured by Terragrunt.  Set them in the [standard way](https://aws.amazon.com/blogs/security/a-new-and-standardized-way-to-manage-credentials-in-the-aws-sdks/).  For now the best way to get these is to ask Angus.

Run `terragrunt get` to setup Terraform.

## Applying infrastructure changes

This follows the standard Terraform with Terragrunt workflow.  First `terragrunt plan` and confirm the changes are as expected.  Then `terragrunt apply` to actually apply the changes.

## Notes

The Heroku app does not support their Github integration, so if you want to use this, you'll have to set it up manually in Heroku's frontend.