# AWS S3 Bucket Provisioning with Terraform

This project is a Terraform configuration that provisions AWS S3 buckets with custom public access settings. It uses a modular setup with separate files for each part of the configuration, allowing for easy maintenance, scalability, and reusability.

## Project Structure

- **`main.tf`**: Defines the core AWS S3 resources. It provisions S3 buckets and sets up public access configurations based on the values in `vars.tfvars`.
- **`provider.tf`**: Configures the AWS provider, specifying the AWS region and authentication method.
- **`variable.tf`**: Declares variables used throughout the project, making the configuration flexible and allowing for customization.
- **`vars.tfvars`**: Contains specific values for the variables, such as bucket configurations and identifiers. This file is used to pass different values to the variables defined in `variable.tf`.

## Files Overview

### `main.tf`

This file is the primary Terraform configuration file. It includes:

- **`aws_s3_bucket`**: Defines S3 buckets using the configurations provided in `vars.tfvars`. Each bucket name is made unique by appending a `studentid`.
- **`aws_s3_bucket_public_access_block`**: Configures the public access settings for each S3 bucket, including options to block public ACLs, block public policies, ignore public ACLs, and restrict public bucket settings.

### `provider.tf`

This file configures the AWS provider:

- **`provider "aws"`**: Specifies the AWS region and authentication options. AWS credentials should be set up in the environment or through an IAM role rather than hardcoding in the file.

### `variable.tf`

This file defines variables used throughout the project, allowing for parameterized configurations. Key variables include:

- **`region`**: The AWS region where resources are created.
- **`studentid`**: A unique identifier added to bucket names for uniqueness.
- **`bucket_configs`**: A list of objects with specific configurations for each S3 bucket, such as name, block public ACLs, and restrict public bucket settings.

### `vars.tfvars`

This file contains values for the variables defined in `variable.tf`, allowing for easy customization of configurations. Key values include:

- **`region`**: The AWS region for resource creation (e.g., `us-east-1`).
- **`studentid`**: Unique identifier to ensure unique bucket names.
- **`bucket_configs`**: A list of S3 bucket configurations, each defining:
  - `name`: Base name for the bucket.
  - `block_public_acls`: Whether to block public ACLs.
  - `block_public_policy`: Whether to block public policies.
  - `ignore_public_acls`: Whether to ignore public ACLs.
  - `restrict_public_buckets`: Whether to restrict public access to the bucket.

## Usage

1. **Initialize Terraform**:
   ```bash
   terraform init


2. Execution
terraform plan -var-file="vars.tfvars"
terraform apply -var-file="vars.tfvars"
terraform destroy -var-file="vars.tfvars"

Requirements
Terraform: Install Terraform from terraform.io.
AWS Account: Configure your AWS CLI with appropriate permissions to create S3 buckets.