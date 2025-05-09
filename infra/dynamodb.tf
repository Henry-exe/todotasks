resource "aws_dynamodb_table" "todo_table" {
  name           = "tasks"
  hash_key = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  tags = {
    Name        = "tasks-table"
    Environment = "production"
  }
}