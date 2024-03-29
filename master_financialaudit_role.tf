# ------------------------------------------------------------------------------
# Create the IAM role that allows access to the Billing policy in the
# Master account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "master_financialaudit_role_assume_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${local.account_ids["users"]}:root",
      ]
    }
  }
}

resource "aws_iam_role" "master_financialaudit_role" {
  provider = aws.master

  assume_role_policy = data.aws_iam_policy_document.master_financialaudit_role_assume_role_doc.json
  description        = var.master_financialaudit_role_description
  name               = var.master_financialaudit_role_name
}

# Attach (standard AWS-defined) Billing policy to the role
resource "aws_iam_role_policy_attachment" "billing_policy_attachment" {
  provider = aws.master

  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
  role       = aws_iam_role.master_financialaudit_role.name
}

# Attach (standard AWS-defined) Purchase Order management policy to the role
resource "aws_iam_role_policy_attachment" "purchaseorder_policy_attachment" {
  provider = aws.master

  policy_arn = "arn:aws:iam::aws:policy/AWSPurchaseOrdersServiceRolePolicy"
  role       = aws_iam_role.master_financialaudit_role.name
}
