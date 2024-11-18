# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "auditors" {
  description = "A map containing the usernames of each auditor and a list of audit roles assigned to that user.  The currently-defined audit roles are  \"financial_audit\" and \"security_audit\".  Example: { \"firstname1.lastname1\" = { \"roles\" = [ \"financial_audit\", \"security_audit\" ] },  \"firstname2.lastname2\" = { \"roles\" = [ \"security_audit\" ] } }."
  nullable    = false
  type        = map(map(list(string)))
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "assume_master_financialaudit_policy_description" {
  default     = "Allow assumption of the FinancialAudit role in the Master account."
  description = "The description to associate with the IAM policy that allows assumption of the role that allows access to the Billing policy in the Master account."
  nullable    = false
  type        = string
}

variable "assume_master_financialaudit_policy_name" {
  default     = "Master-AssumeFinancialAudit"
  description = "The name to assign the IAM policy that allows assumption of the role that allows access to the Billing policy in the Master account."
  nullable    = false
  type        = string
}

variable "assume_various_securityaudit_policy_description" {
  default     = "Allow assumption of the SecurityAudit role in various accounts."
  description = "The description to associate with the IAM policy that allows assumption of the role that allows access to the SecurityAudit policy in the various accounts."
  nullable    = false
  type        = string
}

variable "assume_various_securityaudit_policy_name" {
  default     = "Various-AssumeSecurityAudit"
  description = "The name to assign the IAM policy that allows assumption of the role that allows access to the SecurityAudit policy in the various accounts."
  nullable    = false
  type        = string
}

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  nullable    = false
  type        = string
}

variable "financial_audit_users_group_name" {
  default     = "financial_auditors"
  description = "The name of the group to be created for financial audit users."
  nullable    = false
  type        = string
}

variable "master_financialaudit_role_description" {
  default     = "Allows sufficient access to billing information."
  description = "The description to associate with the IAM role that allows access to the Billing policy in the Master account."
  nullable    = false
  type        = string
}

variable "master_financialaudit_role_name" {
  default     = "FinancialAudit"
  description = "The name to assign the IAM role that allows access to the Billing policy in the Master account."
  nullable    = false
  type        = string
}

variable "security_audit_users_group_name" {
  default     = "security_auditors"
  description = "The name of the group to be created for security audit users."
  nullable    = false
  type        = string
}

variable "securityauditextras_policy_description" {
  default     = "Allows access to additional resources required by security auditors."
  description = "The description to associate with the IAM policy that gives access to additional permissions required by security auditors."
  nullable    = false
  type        = string
}

variable "securityauditextras_policy_name" {
  default     = "SecurityAuditExtras"
  description = "The name to assign the IAM policy that gives access to additional permissions required by security auditors."
  nullable    = false
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  nullable    = false
  type        = map(string)
}

variable "various_securityaudit_role_description" {
  default     = "Allows read-only access to resources for security auditors."
  description = "The description to associate with the IAM role that allows access to the SecurityAudit policy in various AWS accounts."
  nullable    = false
  type        = string
}

variable "various_securityaudit_role_name" {
  default     = "SecurityAudit"
  description = "The name to assign the IAM role that allows access to the SecurityAudit policy in various AWS accounts."
  nullable    = false
  type        = string
}
