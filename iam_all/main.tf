# Create IAM Policy
resource "aws_iam_policy" "ec2_policy" {
  name        = var.policy_name
  description = "IAM policy for EC2 actions"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = var.policy_list,
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

# Create IAM Role
resource "aws_iam_role" "ec2_role" {
  name               = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = var.role_service_name
        }
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

# Create IAM User
resource "aws_iam_user" "ec2_user" {
  name = var.iam_user_name
}

# Create Access Key for IAM User (includes both access key ID and secret access key)
resource "aws_iam_access_key" "ec2_user_key" {
  user = aws_iam_user.ec2_user.name
}

# Attach Policy to IAM User
resource "aws_iam_user_policy_attachment" "ec2_user_policy_attachment" {
  user       = aws_iam_user.ec2_user.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "local_file" "secret_key" {
  content = aws_iam_access_key.ec2_user_key.id
  filename = "/home/ubuntu/secret_key.txt"
}

resource "local_file" "secret_access_key_file" {
  content  = aws_iam_access_key.ec2_user_key.secret
  filename = "/home/ubuntu/secret_access_key.txt" 
#  filename = " /tmp/secret_access_key.txt " 
}

#resource "null_resource" "write_secret_key" {
 # provisioner "local-exec" {
  #  command = "echo ${aws_iam_access_key.ec2_user_key.secret} > /home/bhavin/Desktop/key/secret_access_key.txt"
 # }
#}
