# Terraform & GCP Setup on Windows

> This guide is for **plain Windows users** (not WSL). If using WSL/Ubuntu, skip these steps.

## 1️⃣ Install Google Cloud SDK (gcloud CLI)

1. Download the SDK zip:
```
https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip
```
2. Unzip to a folder, e.g.:  `C:\tools\google-cloud-sdk`
3. Open a Linux-like shell (GitBash, MinGW, Cygwin) or PowerShell and run:
```bash
./install.sh
```
4. Add gcloud to PATH: `C:\tools\google-cloud-sdk\bin`
5. Point gcloud to Python (if using Anaconda):
```bash
export CLOUDSDK_PYTHON=~/Anaconda3/python
```
6. Verify installation:
```bash
gcloud version
```

## 2️⃣ Authenticate gcloud

1. Create a **GCP service account** and download the JSON key to a folder, e.g.: `~/.gc/ny-rides.json`
2. Set the environment variable:
```bash
export GOOGLE_APPLICATION_CREDENTIALS=~/.gc/ny-rides.json
```
3. Activate the service account:
```bash
gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
```
4. Optional OAuth login:
```bash
gcloud auth application-default login
```
5. Fix quota warnings:
```bash
PROJECT_NAME="ny-rides-alexey"
gcloud auth application-default set-quota-project ${PROJECT_NAME}
```

## 3️⃣ Install Terraform

1. Download Terraform: [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)
2. Extract `terraform.exe` to a folder, e.g.: `C:\terraform\`
3. Add folder to PATH: `C:\terraform\`
4. Verify installation:
```bash
terraform version
```

## 4️⃣ Prepare Terraform Files

- Ensure `variables.tf` contains your project ID:
```hcl
variable "project" {
  description = "Your GCP Project ID"
  default     = "ny-rides-alexey"
  type        = string
}
```
- Navigate to your Terraform folder (`main.tf`, `variables.tf`).

## 5️⃣ Run Terraform

1. Initialize:
```bash
terraform init
```
2. Plan:
```bash
terraform plan
```
3. Apply:
```bash
terraform apply -auto-approve
```
> ⚠️ If you get a 403 error, ensure your **service account has Storage Admin and BigQuery Admin permissions**.

## ✅ Summary
- Run Terraform on Windows
- Provision GCS buckets and BigQuery datasets
- Use service accounts securely
- Fully reproducible homework environment
