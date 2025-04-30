# 🌐 Multi-Cloud VM Deployment using Terraform (Free Tier)

This project demonstrates how to deploy a basic Virtual Machine (VM) on **Amazon Web Services (AWS)**, **Microsoft Azure**, and **Google Cloud Platform (GCP)** using [Terraform](https://www.terraform.io/). The configuration strictly uses **free tier** eligible resources, making it ideal for learning and testing purposes without incurring costs.

---

## 🚀 Project Goals

- ✅ Provision one virtual machine each on AWS, Azure, and GCP.
- ✅ Use **only free-tier** eligible resources.
- ✅ Enable simple and reproducible deployment using Terraform.
- ✅ Modular and vendor-separated configuration.

---

## 🛠️ Tech Stack

- Terraform (>= 1.3)
- AWS Free Tier (EC2 t2.micro)
- Azure Free Tier (B1s VM)
- GCP Free Tier (f1-micro instance)
- Git

---

## 📁 Repository Structure

```
multicloud-terraform-vm/
├── aws/       → Terraform config for AWS EC2
├── azure/     → Terraform config for Azure VM
├── gcp/       → Terraform config for GCP VM
├── shared/    → Shared provider/backends (optional)
└── README.md  → Project overview and setup instructions
```

---

## 📦 Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install)
- Cloud accounts for:
  - [AWS](https://aws.amazon.com/free)
  - [Azure](https://azure.microsoft.com/en-us/free)
  - [GCP](https://cloud.google.com/free)
- Local setup for CLI tools (AWS CLI, Azure CLI, gcloud SDK)

---

## ⚙️ Deployment Steps

Each cloud provider has a separate folder. Follow these steps for any provider:

### Step 1: Configure Credentials

Refer to individual provider README inside `/aws`, `/azure`, or `/gcp` for credential setup.

### Step 2: Initialize Terraform

```bash
cd aws      # or azure / gcp
terraform init
```

### Step 3: Plan Deployment

```bash
terraform plan
```

### Step 4: Apply Deployment

```bash
terraform apply
```

---

## ✅ What You’ll Get

| Provider | Instance Type | OS           | Free Tier Eligible |
|----------|---------------|--------------|---------------------|
| AWS      | t2.micro      | Ubuntu 20.04 | ✅ Yes              |
| Azure    | B1s           | Ubuntu 20.04 | ✅ Yes              |
| GCP      | f1-micro      | Ubuntu 20.04 | ✅ Yes (us-west1)   |

---

## 🔐 Security Notice

Ensure that you:

- Use key pairs or SSH authentication.
- Do **not** expose ports unnecessarily (e.g., allow only SSH).
- Destroy infrastructure after testing:

```bash
terraform destroy
```

---

## 📚 References

- [Terraform Docs](https://developer.hashicorp.com/terraform/docs)
- [AWS Free Tier](https://aws.amazon.com/free)
- [Azure Free Services](https://azure.microsoft.com/en-us/free)
- [GCP Free Tier](https://cloud.google.com/free)

---

## 📝 License

This project is licensed under the MIT License.
# Terraform_Multicloud
