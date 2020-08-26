provider aws {
  version                     = "~> 3.0"
  region                      = "us-east-1"
  skip_credentials_validation = true
}

variable modules {
    type = any
}

module main_module {
    source = "./module"
    for_each = var.modules
    sub_modules = each.value
}