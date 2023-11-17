# MS SQL Server and Database - Azure

Before start you need configure your workspace

## 0 - Setup

### Configure git

```sh
# Git config - replace email and username with your info
git config --global user.email "example@gmail.com"
git config --global user.name "Example"

# Fork to you github space
# https://github.com/yolitals/terraform-aprovisionamiento-azure.git

# Clone the repository
git clone https://github.com/[GITHUB-USER]/terraform-aprovisionamiento-azure.git
# Replace [GITHUB-USER] with your github user (Ensure it have been forked).


# Move to cloned repository
cd tterraform-aprovisionamiento-azure
```

## 1 - MS SQL Server

Create a SQL server and adatabase

```sh
# Move to database directory
cd 1-azure-sql
# Get plugins and modules
terraform init
# Dry run to validate resources to create
terraform plan
# expected output:
# Plan: 5 to add, 0 to change, 0 to destroy.
# Create resouces
terraform apply
# If you want destroy resouces
terraform destroy
```

## 2 - Create a table

Create a table into database using a community provider for mssql

```sh
# Move to backend directory
cd 2-database-tables
# Get plugins and modules
terraform init
# Dry run to validate resources to create
terraform plan
# expected output:
# Plan: 1 to add, 0 to change, 0 to destroy.
# Create resouces
terraform apply
# If you want destroy resouces
terraform destroy
```
