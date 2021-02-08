# Fetch all users listed in var.auditors
data "aws_iam_user" "auditors" {
  provider = aws.users

  for_each = var.auditors

  user_name = each.key
}
