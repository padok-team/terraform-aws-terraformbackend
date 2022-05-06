# Bootstrap an AWS project

To start terraforming your infrastructure, you need a place to store you terraform states. On AWS, it is typically a S3 bucket. But what if you want to also terraform this bucket ?

This module can be used in a very light and simple layer to bootstrap your S3 bucket to store your states. Its own state does not contain any critical secrets, so it is safe to be stored in your git repository.

## Bootstrap your S3 backend

- Prerequisites:
  - [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started) > 1.0.0 installed.
  - The [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed.
  - An AWS root account with [secret and access keys](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys).
- Create the layer:
  - Copy the [example_basic](../examples/example_basic/) as a new layer in your infrastructure repository.
  - Replace `bucket_name` and `dynamodb_table_name` if you want to.
- Configure your credentials:
  - Set the environment variable `AWS_SHARED_CREDENTIALS_FILE` to the path where you want to store your credentials. Tip if you have multiple projects: use [direnv](https://direnv.net/) to set it according to the project you are working on!
  - Run `aws configure` and set your access key and secret key.
- Bootstrap your S3 backend. Run:
  - `terraform init`.
  - `terraform plan`: the plan should show the creation of a S3 bucket and a DynamoDB table.
  - `terraform apply`.
- Terraform should have created a `terraform.tfstate` file: commit it to git.

## Use the S3 backend

- Create a new layer:
  - Copy the [example_use_terraformbackend](../examples/example_use_terraformbackend/) as a new layer.
  - Change the bucket name and the DynamoDB table name in the backend to match the one you chose previously.
  - Run `terraform init`.
  - Add your resources and modules, then `terraform apply`.
  - You're all set! 🥳
