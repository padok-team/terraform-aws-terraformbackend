# AWS S3 Backend Terraform module

Terraform module which creates **terraform backend** resources on **AWS**.

## User Stories for this module

- AAOps I can create a backend for the terraform state

## Usage

```hcl
module "terraform_backend" {
  source = "https://github.com/padok-team/terraform-aws-terraformbackend"

  bucket_name           = "my-backend-terraform-state"
  dynamodb_table_name   = "my-backend-terraform-lock"
}
```

## Examples

- [Example of terraform backend creation](examples/example_basic/main.tf)

<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the terraform backend to be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | Name of the backend bucket |
| <a name="output_dynamodb_table"></a> [dynamodb\_table](#output\_dynamodb\_table) | Name of the DynamoDB table |
<!-- END_TF_DOCS -->
