# ToDo List with AWS (Terraform + Lambda + API Gateway + S3 + DynamoDB)

This project is a serverless ToDo List backend, fully provisioned using Terraform and AWS services.

## 🧱 Stack

- **Terraform** – Infrastructure as Code
- **AWS Lambda (Python)** – Function logic
- **Amazon API Gateway** – Public REST API
- **Amazon DynamoDB** – Task storage
- **Amazon S3 (Static Website Hosting)** – Frontend hosting
- **IAM** – Secure access control

## 📁 File Structure

- `provider.tf` – AWS provider configuration
- `s3.tf` – S3 bucket + static website config
- `dynamodb.tf` – DynamoDB table definition
- `lambda.tf` – Lambda function and role
- `apigateway.tf` – API Gateway routes and integrations
- `variables.tf` – Variables used across modules
- `outputs.tf` – Useful outputs (e.g., API URL)
- `lambda/` – Lambda source code (`main.py`)

## 🚀 How to Deploy

1. **Install Terraform** and configure your AWS credentials.
2. Initialize Terraform:
   ```bash
   terraform init
