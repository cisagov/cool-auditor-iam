# ------------------------------------------------------------------------------
# Create the IAM policy with additional permissions needed by financial
# auditors beyond the standard AWS-defined policies.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "financialauditextras_doc" {
  statement {
    actions = [
      # Allows financial auditors to view and manage AWS account settings, such
      # as contact information and alternate contacts.
      "account:AcceptPrimaryEmailUpdate",
      "account:DeleteAlternateContact",
      "account:Get*",
      "account:ListRegions",
      "account:PutAlternateContact",
      "account:PutContactInformation",
      "account:StartPrimaryEmailUpdate",
      # Allows financial auditors to use the AWS Data Exports service to create
      # customized exports from multiple AWS cost management and billing
      # datasets, such as cost and usage data and cost optimization
      # recommendations.
      "bcm-data-exports:*",
      # Allows financial auditors to view and manage AWS Billing Conductor
      # resources such as billing groups, pricing rules, and custom line items.
      "billingconductor:*",
      # Allows financial auditors to query cost and usage data (via the Cost
      # Explorer API) for analysis.
      "ce:*",
      # Allows financial auditors to track AWS costs and usage via the AWS Cost
      # and Usage Report API.
      "cur:*",
      # Allows financial auditors to read S3 bucket policies.
      "s3:GetBucketPolicy",
    ]
    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      # Allows financial auditors to create a bucket to store billing reports,
      # write to it, and update the bucket policy.  The bucket name is the
      # account ID followed by "-fpt-billing".
      "s3:CreateBucket",
      "s3:DeleteObject",
      "s3:DeleteBucketPolicy",
      "s3:PutBucketPolicy",
      "s3:PutObject",
    ]
    resources = [
      "arn:aws:s3:::${local.account_ids["master"]}-fpt-billing",
      "arn:aws:s3:::${local.account_ids["master"]}-fpt-billing/*",
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
