output "financial_audit_group" {
  value       = aws_iam_group.financial_audit_users
  description = "The group of financial auditors."
}

output "security_audit_group" {
  value       = aws_iam_group.security_audit_users
  description = "The group of security auditors."
}
