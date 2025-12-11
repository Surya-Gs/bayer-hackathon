# Terraform project (multi-environment)

This scaffold provides a recommended layout for managing multiple environments (dev, staging, prod) and bootstrapping the remote state backend (S3 bucket + DynamoDB lock table).

Quick steps:

- Bootstrap the remote backend (run in `terraform/backend`):

```bash
cd terraform/backend
terraform init
terraform apply -var="bucket_name=your-unique-bucket-name" -var="lock_table_name=your-lock-table" -var="region=us-east-1"
```

- Configure environment backend (or use `-backend-config` flags) and initialize per environment:

```bash
cd terraform/envs/dev
terraform init -backend-config="bucket=your-unique-bucket-name" -backend-config="key=envs/dev/terraform.tfstate" -backend-config="region=us-east-1" -backend-config="dynamodb_table=your-lock-table"
terraform apply
```

Notes:
- Replace `your-unique-bucket-name` with a globally unique S3 bucket name.
- The `backend` folder will create the S3 bucket and DynamoDB table used to store and lock state.
- Environment configs in `envs/` use the modules in `modules/` to provision resources.
