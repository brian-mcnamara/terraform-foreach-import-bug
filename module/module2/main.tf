variable variables {
    type = map
}

resource "aws_s3_bucket" "bucket" {
  bucket        = var.variables.bucket
  acl           = "private"
  provider      = aws
}