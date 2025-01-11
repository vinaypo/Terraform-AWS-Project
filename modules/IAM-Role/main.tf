resource "aws_iam_policy" "s3-policy" {
  name = "s3-policy"
  description = "Allow S3 access"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action =  [
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  }) 
}

resource "aws_iam_policy" "s3_list_buckets_policy" {
  name        = "s3_list_buckets_policy"
  description = "Policy to allow listing all S3 buckets"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "s3:ListAllMyBuckets"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "s3-role" {
    name = "s3-role"
    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Sid    = ""
          Principal = {
            Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3-ec2-role" {
  role = aws_iam_role.s3-role.name
  policy_arn = aws_iam_policy.s3-policy.arn
  
}

resource "aws_iam_role_policy_attachment" "s3-list-buckets" {
  role = aws_iam_role.s3-role.name
  policy_arn = aws_iam_policy.s3_list_buckets_policy.arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.s3-role.name
}