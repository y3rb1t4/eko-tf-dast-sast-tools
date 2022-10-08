output "function_name" {
  description = "Name of the Lambda function."
  value = aws_lambda_function.crud_lambda.function_name
}

output "stage_url" {
  value = aws_apigatewayv2_stage.project.invoke_url
}

output "url" {
  value = aws_apigatewayv2_api_mapping.example.domain_name
}

output "path" {
  value = aws_apigatewayv2_api_mapping.example.api_mapping_key
}