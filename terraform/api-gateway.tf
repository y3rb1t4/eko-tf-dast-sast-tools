locals {
  http_root_route = toset([
    "GET /items",
    "PUT /items",
    "GET /"
  ])
}

locals {
  http_child_route = toset([
    "GET /items/{id}",
    "DELETE /items/{id}" 
  ])
}

# locals {
#   stages = toset([
#     "$default"
#   ])
# }

resource "aws_apigatewayv2_api" "project" {
  name          = "${var.app_id}-api-${var.app_env}"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "project" {
  api_id      = aws_apigatewayv2_api.project.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "project" {
  api_id = aws_apigatewayv2_api.project.id
  payload_format_version = "2.0"

  integration_uri    = aws_lambda_function.crud_lambda.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "root" {
  for_each = local.http_root_route
  api_id = aws_apigatewayv2_api.project.id

  route_key = each.key
  target    = "integrations/${aws_apigatewayv2_integration.project.id}"
}

resource "aws_apigatewayv2_route" "child" {
  for_each = local.http_child_route
  api_id = aws_apigatewayv2_api.project.id

  route_key = each.key
  target    = "integrations/${aws_apigatewayv2_integration.project.id}"

  depends_on  = [
      aws_apigatewayv2_route.root       
      ]
}

resource "aws_apigatewayv2_api_mapping" "example" {
  api_id          = aws_apigatewayv2_api.project.id
  domain_name     = "${var.domain}"
  #stage           = "$default"
  stage           = aws_apigatewayv2_stage.project.id
  api_mapping_key = "${var.app_env}"
}


resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "${terraform.workspace}_AllowExecutionFromAPI"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.crud_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.project.execution_arn}/*/*/*"
}
