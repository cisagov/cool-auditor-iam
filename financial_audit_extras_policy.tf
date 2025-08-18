# ------------------------------------------------------------------------------
# Create the IAM policy with additional permissions needed by financial
# auditors beyond the standard AWS-defined policies.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "financialauditextras_doc" {
  statement {
    actions = [
      "ce:GetCostAndUsage",
      "ce:GetCostForecast",
    ]
    resources = [
      "*",
    ]
  }
}

# Create the FinancialAuditExtras policy in the master account
resource "aws_iam_policy" "master_financialauditextras_policy" {
  provider = aws.master

  description = var.financialauditextras_policy_description
  name        = var.financialauditextras_policy_name
  policy      = data.aws_iam_policy_document.financialauditextras_doc.json
}
