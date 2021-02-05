# This is the "default" provider that is used to obtain the caller's
# credentials, which are used to set the session name when assuming roles in
# the other providers.

provider "aws" {
  region = var.aws_region
}

# The provider used to create resources inside the Audit account.
provider "aws" {
  alias  = "audit"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.audit.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create resources inside the DNS account.
provider "aws" {
  alias  = "dns"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.dns.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create resources inside the Images account.
provider "aws" {
  alias  = "images"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.images.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create resources inside the Log Archive account.
provider "aws" {
  alias  = "logarchive"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.logarchive.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create resources inside the Master account.
provider "aws" {
  alias  = "master"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.master.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create resources inside the Shared Services account.
provider "aws" {
  alias  = "sharedservices"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.sharedservices.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create resources inside the Terraform account.
provider "aws" {
  alias  = "terraform"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.terraform.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create resources inside the Users account.
provider "aws" {
  alias  = "users"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.users.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}
