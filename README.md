# Terraform bug repo

This repo contains a TF project to reproduce a bug on TF0.13 when using modules for_each statement

## Repo steps

This project uses AWS but can be reconfigured for others. Before you start we will need to create an IAM user:  
Create a user named `test-shared-user` with programmatic access (really just need a user to import later)

Once user has been created, we will attempt to import the user into terraform which should be allowed since it has no
dependencies nor dependants.

* `terraform init`
* `terraform import 'module.main_module["module1"].aws_iam_user.shared_user' test-shared-user`

Which will result in:  
```
module.main_module["module1"].aws_iam_user.shared_user: Importing from ID "test-shared-user"...
module.main_module["module1"].aws_iam_user.shared_user: Import prepared!
  Prepared aws_iam_user for import
module.main_module["module1"].aws_iam_user.shared_user: Refreshing state... [id=test-shared-user]

Error: Invalid for_each argument

  on module/main.tf line 11, in module "test":
  11:     for_each = var.sub_modules

The "for_each" value depends on resource attributes that cannot be determined
until apply, so Terraform cannot predict how many instances will be created.
To work around this, use the -target argument to first apply only the
resources that the for_each depends on.
```