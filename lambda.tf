resource "aws_dynamodb_table" "acheung_visitor_counter" {
  name             = "acheung_visitor_counter"
  hash_key         = "pk"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "pk"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "crc_visit_count_item" {
  table_name = aws_dynamodb_table.acheung_visitor_counter.id
  hash_key   = aws_dynamodb_table.acheung_visitor_counter.hash_key

  item = <<ITEM
{
  "pk": {"S": "no_visits"},
  "hits": {"N": "0"}
}
ITEM
}