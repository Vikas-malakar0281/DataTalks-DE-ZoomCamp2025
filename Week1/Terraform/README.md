# [Terraform](/Week1/Terraform)

## What is Terraform?

Terraform is an open-source **Infrastructure as Code (IaC)** tool used to **create**, **update**, and **delete** cloud or on-prem infrastructure in a safe, repeatable, and automated way. It supports multiple cloud providers such as **AWS**, **GCP**, **Azure**, and many others.

For full documentation, visit the official Terraform Registry:  
https://registry.terraform.io/

Instead of manually provisioning resources through a cloud console, Terraform allows us to define infrastructure using simple configuration files. This makes deployments:

- **Scalable**
- **Version-controlled**
- **Reusable**
- **Consistent across environments**

In the DataTalksClub Data Engineering Zoomcamp, Terraform is used to automatically set up essential cloud resources such as storage buckets, service accounts, permissions, and compute components needed for the data pipeline — using only two configuration files and a few CLI commands.

---

## Terraform Files Used

### 🔹 [`main.tf`](main.tf)
This file contains the main configuration for provisioning resources such as:
- Google Cloud Storage (GCS) buckets  
- Service accounts  
- IAM permissions  
- Any other infrastructure required for the Zoomcamp project

### 🔹 `variables.tf`(variable.tf)
This file stores all reusable variables (project ID, region, bucket name, etc.), making the configuration clean, modular, and easy to update.

---
## CLI Commands Used

### `terraform init`
Initializes Terraform in the current directory.  
It downloads required provider plugins and prepares Terraform to run.

### `terraform plan`
Shows the execution plan in a structured format.  
This lets you preview changes Terraform will apply *before* making them.

### `terraform apply`
Applies the execution plan and provisions the infrastructure.  
Terraform also creates a **state file (`terraform.tfstate`)** that tracks deployed resources.

### `terraform destroy`
Destroys all resources created by Terraform as defined in the configuration files.  
Useful for cleanup during testing or project teardown.

---
