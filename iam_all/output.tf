output "access_key_id" {
  value       = aws_iam_access_key.ec2_user_key.id
  description = "The access key ID for the IAM user"
}

output "secret_access_key" {
  value       = aws_iam_access_key.ec2_user_key.secret
  description = "The secret access key for the IAM user"
  sensitive = true
}
