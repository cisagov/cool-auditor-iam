output "financial_audit_group" {
  description = "The group of financial auditors."
  value       = aws_iam_group.financial_audit_users
}

output "security_audit_group" {
  description = "The group of security auditors."
  value       = aws_iam_group.security_audit_users
}
