# ------------------------------------------------------------------------------
# Retrieves state data from a Terraform backend. This allows use of the
# root-level outputs of one or more Terraform configurations as input data
# for this configuration.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "audit" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/audit.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to match the current Terraform workspace.
  workspace = "production"
}

data "terraform_remote_state" "dns" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/dns.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to match the current Terraform workspace.
  workspace = "production"
}

data "terraform_remote_state" "images" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/images.tfstate"
  }

  workspace = terraform.workspace
}

data "terraform_remote_state" "logarchive" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/logarchive.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to match the current Terraform workspace.
  workspace = "production"
}

data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/master.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to match the current Terraform workspace.
  workspace = "production"
}

data "terraform_remote_state" "sharedservices" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/shared_services.tfstate"
  }

  workspace = terraform.workspace
}

data "terraform_remote_state" "terraform" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/terraform.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to match the current Terraform workspace.
  workspace = "production"
}

data "terraform_remote_state" "users" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/users.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to match the current Terraform workspace.
  workspace = "production"
}
