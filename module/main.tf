variable sub_modules {
    type = any
}

resource "aws_iam_user" "shared_user" {
  name                 = "test-shared-user"
}

module test {
    source = "./module2"
    for_each = var.sub_modules
    variables = each.value
}