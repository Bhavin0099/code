region = "ap-northeast-2"

policy_list = [ "ec2:AuthorizeSecurityGroupEgress", "ec2:AuthorizeSecurityGroupIngress",
          "ec2:DescribeInstances",
          "ec2:TerminateInstances",
          "ec2:DescribeTags",
          "ec2:CreateTags",
          "ec2:DescribeInstanceAttribute",
          "ec2:RunInstances",
          "ec2:DescribeVpcAttribute",
          "ec2:DescribeInstanceCreditSpecifications",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeImages",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribeVpcs",
          "ec2:CreateSecurityGroup",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:DescribeVolumes",
          "ec2:DeleteSecurityGroup",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeSubnets" ]

policy_name = "task2_policy"

role_name = "task2_role"

role_service_name = "ec2.amazonaws.com"

iam_user_name = "task2_user"
