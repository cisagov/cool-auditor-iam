# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "auditors" {
  type        = map(map(list(string)))
  description = "A map containing the usernames of each auditor and a list of audit roles assigned to that user.  The currently-defined audit roles are  \"financial_audit\" and \"security_audit\".  Example: { \"firstname1.lastname1\" = { \"roles\" = [ \"financial_audit\", \"security_audit\" ] },  \"firstname2.lastname2\" = { \"roles\" = [ \"security_audit\" ] } }."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "assume_master_financialaudit_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows assumption of the role that allows access to the Billing policy in the Master account."
  default     = "Allow assumption of the FinancialAudit role in the Master account."
}

variable "assume_master_financialaudit_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that allows assumption of the role that allows access to the Billing policy in the Master account."
  default     = "Master-AssumeFinancialAudit"
}

variable "assume_various_securityaudit_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows assumption of the role that allows access to the SecurityAudit policy in the various accounts."
  default     = "Allow assumption of the SecurityAudit role in various accounts."
}

variable "assume_various_securityaudit_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that allows assumption of the role that allows access to the SecurityAudit policy in the various accounts."
  default     = "Various-AssumeSecurityAudit"
}

variable "aws_region" {
  type        = string
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  default     = "us-east-1"
}

variable "financial_audit_users_group_name" {
  type        = string
  description = "The name of the group to be created for financial audit users."
  default     = "financial_auditors"
}

variable "master_financialaudit_role_description" {
  type        = string
  description = "The description to associate with the IAM role that allows access to the Billing policy in the Master account."
  default     = "Allows sufficient access to billing information."
}

variable "master_financialaudit_role_name" {
  type        = string
  description = "The name to assign the IAM role that allows access to the Billing policy in the Master account."
  default     = "FinancialAudit"
}

variable "security_audit_users_group_name" {
  type        = string
  description = "The name of the group to be created for security audit users."
  default     = "security_auditors"
}

variable "securityauditextras_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that gives access to additional permissions required by security auditors."
  default     = "Allows access to additional resources required by security auditors."
}

variable "securityauditextras_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that gives access to additional permissions required by security auditors."
  default     = "SecurityAuditExtras"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}

variable "various_securityaudit_role_description" {
  type        = string
  description = "The description to associate with the IAM role that allows access to the SecurityAudit policy in various AWS accounts."
  default     = "Allows read-only access to resources for security auditors."
}

variable "various_securityaudit_role_name" {
  type        = string
  description = "The name to assign the IAM role that allows access to the SecurityAudit policy in various AWS accounts."
  default     = "SecurityAudit"
}
