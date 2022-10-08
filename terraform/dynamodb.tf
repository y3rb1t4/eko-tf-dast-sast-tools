resource "aws_dynamodb_table" "project" {
  name           = "${var.app_id}-${var.app_env}-items"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

}