output "key-id" {
  description = "KMS KEY ID: "
  value       = aws_kms_key.vault.id
}

output "key-arn" {
  description = "KMS Key ARN: "
  value       = aws_kms_key.vault.arn
}

output "alias-arn" {
  description = "KMS Alias ARN: "
  value       = aws_kms_alias.alias.arn
}
