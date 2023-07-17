# cool-auditor-iam #

[![GitHub Build Status](https://github.com/cisagov/cool-auditor-iam/workflows/build/badge.svg)](https://github.com/cisagov/cool-auditor-iam/actions)

This project is used to manage IAM permissions for auditor users.

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [backend.tf](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [backend.tf](backend.tf)).
- Access to all of the Terraform remote states specified in
  [remote_states.tf](remote_states.tf).
- User accounts for all auditor users must have been created previously.  We
  recommend using the
  [`cisagov/cool-users-non-admin`](https://github.com/cisagov/cool-users-non-admin)
  repository to create auditor user accounts.

## Usage ##

1. Create a Terraform workspace (if you haven't already done so) by running
   `terraform workspace new <workspace_name>`
1. Create a `<workspace_name>.tfvars` file with all of the required
  variables (see [Inputs](#inputs) below for details):

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
| terraform | ~> 1.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |
| aws.audit | ~> 3.38 |
| aws.dns | ~> 3.38 |
| aws.images | ~> 3.38 |
| aws.logarchive | ~> 3.38 |
| aws.master | ~> 3.38 |
| aws.sharedservices | ~> 3.38 |
| aws.terraform | ~> 3.38 |
| aws.users | ~> 3.38 |
| terraform | n/a |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_group.financial_audit_users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.security_audit_users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.assume_master_financialaudit_role_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.assume_various_securityaudit_roles_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.securityaudit_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.securityauditextras_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.assume_master_financialaudit_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.assume_various_securityaudit_roles](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.audit_securityauditextras_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.dns_securityauditextras_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.images_securityauditextras_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.logarchive_securityauditextras_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.sharedservices_securityauditextras_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.terraform_securityauditextras_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.users_securityauditextras_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.audit_securityaudit_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.dns_securityaudit_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.images_securityaudit_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.logarchive_securityaudit_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.master_financialaudit_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.sharedservices_securityaudit_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.terraform_securityaudit_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.audit_securityaudit_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.audit_securityauditextras_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.billing_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.dns_securityaudit_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.dns_securityauditextras_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.images_securityaudit_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.images_securityauditextras_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.logarchive_securityaudit_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.logarchive_securityauditextras_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.purchaseorder_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.sharedservices_securityaudit_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.sharedservices_securityauditextras_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.terraform_securityaudit_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.terraform_securityauditextras_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user_group_membership.financial_audit](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_group_membership.security_audit](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_caller_identity.audit](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.images](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.logarchive](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.sharedservices](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_master_financialaudit_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_various_securityaudit_roles_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.master_financialaudit_role_assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.securityaudit_role_assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.securityauditextras_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_user.auditors](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_user) | data source |
| [terraform_remote_state.audit](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.dns](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.images](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.logarchive](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.master](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.sharedservices](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.terraform](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assume\_master\_financialaudit\_policy\_description | The description to associate with the IAM policy that allows assumption of the role that allows access to the Billing policy in the Master account. | `string` | `"Allow assumption of the FinancialAudit role in the Master account."` | no |
| assume\_master\_financialaudit\_policy\_name | The name to assign the IAM policy that allows assumption of the role that allows access to the Billing policy in the Master account. | `string` | `"Master-AssumeFinancialAudit"` | no |
| assume\_various\_securityaudit\_policy\_description | The description to associate with the IAM policy that allows assumption of the role that allows access to the SecurityAudit policy in the various accounts. | `string` | `"Allow assumption of the SecurityAudit role in various accounts."` | no |
| assume\_various\_securityaudit\_policy\_name | The name to assign the IAM policy that allows assumption of the role that allows access to the SecurityAudit policy in the various accounts. | `string` | `"Various-AssumeSecurityAudit"` | no |
| auditors | A map containing the usernames of each auditor and a list of audit roles assigned to that user.  The currently-defined audit roles are  "financial\_audit" and "security\_audit".  Example: { "firstname1.lastname1" = { "roles" = [ "financial\_audit", "security\_audit" ] },  "firstname2.lastname2" = { "roles" = [ "security\_audit" ] } }. | `map(map(list(string)))` | n/a | yes |
| aws\_region | The AWS region where the non-global resources are to be provisioned (e.g. "us-east-1"). | `string` | `"us-east-1"` | no |
| financial\_audit\_users\_group\_name | The name of the group to be created for financial audit users. | `string` | `"financial_auditors"` | no |
| master\_financialaudit\_role\_description | The description to associate with the IAM role that allows access to the Billing policy in the Master account. | `string` | `"Allows sufficient access to billing information."` | no |
| master\_financialaudit\_role\_name | The name to assign the IAM role that allows access to the Billing policy in the Master account. | `string` | `"FinancialAudit"` | no |
| security\_audit\_users\_group\_name | The name of the group to be created for security audit users. | `string` | `"security_auditors"` | no |
| securityauditextras\_policy\_description | The description to associate with the IAM policy that gives access to additional permissions required by security auditors. | `string` | `"Allows access to additional resources required by security auditors."` | no |
| securityauditextras\_policy\_name | The name to assign the IAM policy that gives access to additional permissions required by security auditors. | `string` | `"SecurityAuditExtras"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |
| various\_securityaudit\_role\_description | The description to associate with the IAM role that allows access to the SecurityAudit policy in various AWS accounts. | `string` | `"Allows read-only access to resources for security auditors."` | no |
| various\_securityaudit\_role\_name | The name to assign the IAM role that allows access to the SecurityAudit policy in various AWS accounts. | `string` | `"SecurityAudit"` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| financial\_audit\_group | The group of financial auditors. |
| security\_audit\_group | The group of security auditors. |

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
