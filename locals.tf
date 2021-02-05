# ------------------------------------------------------------------------------
# Retrieve the effective Account ID, User ID, and ARN in which Terraform is
# authorized.  This is used to calculate the session names for assumed roles.
# ------------------------------------------------------------------------------
data "aws_caller_identity" "current" {}

# ------------------------------------------------------------------------------
# Create caller identities for every account that we need the Account ID of.
# ------------------------------------------------------------------------------
data "aws_caller_identity" "audit" {
  provider = aws.audit
}

data "aws_caller_identity" "dns" {
  provider = aws.dns
}

data "aws_caller_identity" "images" {
  provider = aws.images
}

data "aws_caller_identity" "logarchive" {
  provider = aws.logarchive
}

data "aws_caller_identity" "master" {
  provider = aws.master
}

data "aws_caller_identity" "sharedservices" {
  provider = aws.sharedservices
}

data "aws_caller_identity" "terraform" {
  provider = aws.terraform
}

# ------------------------------------------------------------------------------
# Evaluate expressions for use throughout this configuration.
# ------------------------------------------------------------------------------
locals {
  # Extract the user name of the current caller for use
  # as assume role session names.
  caller_user_name = split("/", data.aws_caller_identity.current.arn)[1]

  # Store all necessary account IDs
  account_ids = {
    "audit"          = data.aws_caller_identity.audit.account_id
    "dns"            = data.aws_caller_identity.dns.account_id
    "images"         = data.aws_caller_identity.images.account_id
    "logarchive"     = data.aws_caller_identity.logarchive.account_id
    "master"         = data.aws_caller_identity.master.account_id
    "sharedservices" = data.aws_caller_identity.sharedservices.account_id
    "terraform"      = data.aws_caller_identity.terraform.account_id
    "users"          = data.aws_caller_identity.current.account_id
  }
}
