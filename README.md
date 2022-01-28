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
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the bucket to be created for terraform backend | `string` | `"terraform-state-bucket"` | no |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | Name of the DynamoDB table to be created for terraform backend which is used as a terraform lock | `string` | `"terraform-state-lock-table"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamodb_table_id"></a> [dynamodb\_table\_id](#output\_dynamodb\_table\_id) | Name of the DynamoDB table |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | Name of the backend bucket |
<!-- END_TF_DOCS -->

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

```text
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the the License.
```
