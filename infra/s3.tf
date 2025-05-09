resource "aws_s3_bucket" "todo_bucket" {
  bucket = "todo-site-henry"
}

resource "aws_s3_bucket_website_configuration" "todo_website" {
  bucket = aws_s3_bucket.todo_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}