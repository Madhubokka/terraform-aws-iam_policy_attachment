resource "aws_iam_policy" "policy" {
  name        = "${var.policyname}"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "S3:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}



resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  #users      = [aws_iam_user.user.name]
  #groups     = [aws_iam_group.group.name]
  roles      = ["${var.attachrole}"]
  policy_arn = aws_iam_policy.policy.arn
}