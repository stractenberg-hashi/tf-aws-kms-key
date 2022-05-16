provider "aws" {
  region = var.aws_region
}

resource "aws_kms_key" "vault" {
  description = "Vault unseal key"
  #deletion_window_in_days = 10

  tags = {
    Name    = "${var.engineer}-vault-kms-unseal",
    Created = "via Terraform"
  }
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.vault.key_id
}
