resource "aws_iam_role" "this" {

  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = var.service
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Environment = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "this" {

  role       = aws_iam_role.this.name
  policy_arn = var.policy_arn
}

resource "aws_iam_instance_profile" "this" {

  name = "${var.role_name}-profile"
  role = aws_iam_role.this.name
}
