resource "random_id" "bucket_suffix" {
  keepers = {
    project_name = local.project
  }

  byte_length = 8
}

resource "aws_s3_bucket" "codedeploy_bucket" {
  bucket        = "${local.project}-codedeploy-bucket-${random_id.bucket_suffix.hex}"
  force_destroy = true

  object_lock_enabled = false
}

resource "aws_iam_role" "codedeploy_service_role" {
  name = "${local.project}-codedeploy-service-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "codedeploy.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "codedeploy_service_policy" {
  role       = aws_iam_role.codedeploy_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

resource "aws_codedeploy_app" "web_app" {
  name             = "${local.project}-web-app"
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "web_dg" {
  app_name              = aws_codedeploy_app.web_app.name
  deployment_group_name = "${local.project}-web-dg"
  service_role_arn      = aws_iam_role.codedeploy_service_role.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = local.project
    }
  }
}
