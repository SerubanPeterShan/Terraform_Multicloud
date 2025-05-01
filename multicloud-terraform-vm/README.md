# 🌐 Multi-Cloud VM Deployment using Terraform (Free Tier)

This project demonstrates how to deploy Virtual Machines on AWS, Azure, and Google Cloud Platform using Terraform. All resources are configured to use free tier eligible options.

## 🚀 Features

- Deploys free-tier VMs on all three major cloud providers
- Uses Infrastructure as Code (IaC) with Terraform
- Modular architecture with separate configurations for each cloud
- SSH key authentication for secure access

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/install) (v1.3.0+)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- SSH key pair (generate with `ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa`)

## 🔑 Authentication Setup

### AWS
```bash
aws configure
```

### Azure
```bash
az login
```

### Google Cloud
```bash
gcloud auth application-default login
```

## ⚙️ Configuration

1. Edit `terraform.tfvars` with your specific values:
   ```
   # GCP Variables
   project              = "your-gcp-project-id"
   gcp_region           = "us-west1"
   ssh_user             = "gcpuser"
   
   # Azure Variables
   admin_username       = "azureuser"
   location             = "eastus"
   
   # AWS Variables
   aws_region           = "us-east-1"
   key_name             = "your-aws-key-name"
   
   # Shared Variables
   ssh_public_key_path  = "~/.ssh/id_rsa.pub"
   ```

2. Ensure you have created an SSH key pair and that the `key_name` in AWS matches an existing key pair name in your AWS account.

## 🚀 Deployment

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Plan the deployment:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. After deployment completes, you'll see the output with public IP addresses and SSH commands for each VM.

## 💻 Accessing Your VMs

The deployment will output SSH commands for each VM. For example:

```
ssh_commands = {
  "aws" = "ssh -i ~/.ssh/id_rsa ec2-user@34.228.10.85"
  "azure" = "ssh -i ~/.ssh/id_rsa azureuser@40.88.123.45"
  "gcp" = "ssh -i ~/.ssh/id_rsa gcpuser@35.247.67.89"
}
```

## 🧹 Cleanup

To avoid charges, destroy all resources when you're done:

```bash
terraform destroy
```

## ⚠️ Important Notes

- Ensure your AWS key pair exists in the specified region before deployment
- Even though these are free-tier resources, they may incur charges if:
  - You exceed free tier limits
  - Your free tier eligibility has expired
  - You deploy in regions where free tier is not available

## 📦 Resources Created

| Cloud | Resource Type | Specification | Region |
|-------|--------------|---------------|--------|
| AWS | EC2 Instance | t2.micro | us-east-1 |
| Azure | Virtual Machine | Standard_B1s | eastus |
| GCP | Compute Instance | f1-micro | us-west1 |