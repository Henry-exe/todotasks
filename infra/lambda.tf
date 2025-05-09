data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/lambda.zip"
}
resource "aws_lambda_function" "todo_lambda" {
  function_name = "todo_function"
  filename  = data.archive_file.lambda.output_path
  source_code_hash = data.archive_file.lambda.output_base64sha256
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "main.handler"
  runtime = "python3.12"
}

