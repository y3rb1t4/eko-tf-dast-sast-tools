
resource "aws_lambda_function" "crud_lambda" {
  function_name         = local.function_name
  runtime               = "nodejs14.x"
  handler               = "index.handler"
  timeout               = 10
  publish               = true
  s3_bucket             = "${var.bucket}"
  s3_key                = "${var.app_env}/${var.lambda_package}"
  role                  = aws_iam_role.lambda_exec.arn
  environment {
    variables = {
      DEMO_URL = var.repo_url
      DYNAMODB_TABLE = aws_dynamodb_table.project.name
    }
  }
  tags = local.common_tags
}

