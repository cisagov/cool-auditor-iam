# cool-auditor-iam #

[![GitHub Build Status](https://github.com/cisagov/cool-auditor-iam/workflows/build/badge.svg)](https://github.com/cisagov/cool-auditor-iam/actions)

This project is used to manage IAM permissions for auditor users.

## Pre-requisites ##

The user accounts for all auditors must have been previously created (we
recommend using the
[`cool-users-non-admin`](https://github.com/cisagov/cool-users-non-admin)
repository to create users).

## Usage ##

1. Create a Terraform workspace (if you haven't already done so) by running
   `terraform workspace new <workspace_name>`
1. Create a `<workspace_name>.tfvars` file with all of the required
  variables (see [Inputs](#Inputs) below for details):

  ```hcl
  auditors = {
    "firstname1.lastname1"    = { "roles" = ["security_audit"] },
    "firstname2.lastname2"    = { "roles" = ["financial_audit"] },
    "firstname3.lastname3"    = { "roles" = ["financial_audit", "security_audit"] },
  }
  ```

1. Run the command `terraform init`.
1. Run the command `terraform apply
  -var-file=<workspace_name>.tfvars`.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 3.0 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| aws.audit | ~> 3.0 |
| aws.dns | ~> 3.0 |
| aws.images | ~> 3.0 |
| aws.logarchive | ~> 3.0 |
| aws.master | ~> 3.0 |
| aws.sharedservices | ~> 3.0 |
| aws.terraform | ~> 3.0 |
| aws.users | ~> 3.0 |
| terraform | n/a |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assume_master_financialaudit_policy_description | The description to associate with the IAM policy that allows assumption of the role that allows access to the Billing policy in the Master account. | `string` | `Allow assumption of the FinancialAudit role in the Master account.` | no |
| assume_master_financialaudit_policy_name | The name to assign the IAM policy that allows assumption of the role that allows access to the Billing policy in the Master account. | `string` | `Master-AssumeFinancialAudit` | no |
| assume_various_securityaudit_policy_description | The description to associate with the IAM policy that allows assumption of the role that allows access to the SecurityAudit policy in the various accounts. | `string` | `Allow assumption of the SecurityAudit role in various accounts.` | no |
| assume_various_securityaudit_policy_name | The name to assign the IAM policy that allows assumption of the role that allows access to the SecurityAudit policy in the various accounts. | `string` | `Various-AssumeSecurityAudit` | no |
| auditors | A map containing the usernames of each auditor and a list of audit roles assigned to that user.  Example: { "firstname1.lastname1" = { "roles" = [ "financial_audit", "security_audit" ] },  "firstname2.lastname2" = { "roles" = [ "security_audit" ] } } | `map` | n/a | yes |
| aws_region | The AWS region where the non-global resources are to be provisioned (e.g. "us-east-1"). | `string` | `us-east-1` | no |
| financial_audit_users_group_name | The name of the group to be created for financial audit users. | `string` | `financial_auditors` | no |
| master_financialaudit_role_description | The description to associate with the IAM role that allows access to the Billing policy in the Master account. | `string` | `Allows sufficient access to billing information.` | no |
| master_financialaudit_role_name | The name to assign the IAM role that allows access to the Billing policy in the Master account. | `string` | `FinancialAudit` | no |
| security_audit_users_group_name | The name of the group to be created for security audit users. | `string` | `security_auditors` | no |
| securityauditextras_policy_description | The description to associate with the IAM policy that gives access to additional permissions required by security auditors. | `string` | `Allows access to additional resources required by security auditors.` | no |
| securityauditextras_policy_name | The name to assign the IAM policy that gives access to additional permissions required by security auditors. | `string` | `SecurityAuditExtras` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{}` | no |
| various_securityaudit_role_description | The description to associate with the IAM role that allows access to the SecurityAudit policy in various AWS accounts. | `string` | `Allows read-only access to resources for security auditors.` | no |
| various_securityaudit_role_name | The name to assign the IAM role that allows access to the SecurityAudit policy in various AWS accounts. | `string` | `SecurityAudit` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| financial_audit_group | The group of financial auditors |
| security_audit_group | The group of security auditors |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is only the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
