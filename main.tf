provider "aws" {
  region = var.aws_region
}

resource "aws_kms_key" "vault" {
  description = "Vault unseal key"
  #deletion_window_in_days = 10

  tags = {
    Name = "${var.engineer}-vault-kms-unseal"
  }
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.vault.key_id
}

# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     effect  = "Allow"
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["ec2.amazonaws.com"]
#     }
#   }
# }

# data "aws_iam_policy_document" "vault-kms-unseal" {
#   statement {
#     sid       = "VaultKMSUnseal"
#     effect    = "Allow"
#     resources = [aws_kms_key.vault.arn]

#     actions = [
#       "kms:Encrypt",
#       "kms:Decrypt",
#       "kms:DescribeKey",
#     ]
#   }
# }

# resource "aws_iam_role" "vault-kms-unseal" {
#   name               = "${var.engineer}-vault-kms-role"
#   assume_role_policy = data.aws_iam_policy_document.assume_role.json
# }

# resource "aws_iam_role_policy" "vault-kms-unseal" {
#   name   = "${var.engineer}-Vault-KMS-Unseal"
#   role   = aws_iam_role.vault-kms-unseal.id
#   policy = data.aws_iam_policy_document.vault-kms-unseal.json
# }

# resource "aws_iam_instance_profile" "vault-kms-unseal" {
#   name = "${var.engineer}-vault-kms-unseal"
#   role = aws_iam_role.vault-kms-unseal.name
# }

# Add an alias to the key

