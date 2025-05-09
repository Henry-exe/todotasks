resource "aws_api_gateway_rest_api" "todo_rest_api" {
  name        = "todo-rest-api"
  description = "API para o projeto todolist"
}
resource "aws_api_gateway_resource" "todo_resource_api" {
  rest_api_id = aws_api_gateway_rest_api.todo_rest_api.id
  parent_id   = aws_api_gateway_rest_api.todo_rest_api.root_resource_id
  path_part   = "mydemoresource"
}

resource "aws_api_gateway_method" "todo_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.todo_rest_api.id
  resource_id   = aws_api_gateway_resource.todo_resource_api.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "todo_post_method" {
  rest_api_id   = aws_api_gateway_rest_api.todo_rest_api.id
  resource_id   = aws_api_gateway_resource.todo_resource_api.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.todo_rest_api.id
  resource_id             = aws_api_gateway_resource.todo_resource_api.id
  http_method             = aws_api_gateway_method.todo_post_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.todo_lambda.invoke_arn
}

resource "aws_api_gateway_deployment" "todo_deployment" {
  rest_api_id = aws_api_gateway_rest_api.todo_rest_api.id
  stage_name  = "prod"

  depends_on = [
    aws_api_gateway_integration.lambda_integration
  ]
}
