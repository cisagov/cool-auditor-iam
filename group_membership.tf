# Put financial_audit users in the appropriate group
resource "aws_iam_user_group_membership" "financial_audit" {
  provider = aws.users

  for_each = toset([for username, attributes in var.auditors : username if contains(attributes["roles"], "financial_audit")])

  user = data.aws_iam_user.auditors[each.key].user_name

  groups = [
    aws_iam_group.financial_audit_users.name
  ]
}

# Put security_audit users in the appropriate group
resource "aws_iam_user_group_membership" "security_audit" {
  provider = aws.users

  for_each = toset([for username, attributes in var.auditors : username if contains(attributes["roles"], "security_audit")])

  user = data.aws_iam_user.auditors[each.key].user_name

  groups = [
    aws_iam_group.security_audit_users.name
  ]
}
