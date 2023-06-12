# AKS Multi-Region
The code base contains a sample solution for establishing a high available AKS cluster in Azure, by using AKS in multiple region and diverting the traffic by usage of Azure front door.

## Introduction
By default, AKS provides high availability by using multiple nodes in a Virtual Machine Scale Set (VMSS). But these multiple nodes don’t protect your system from a region failure. This tutorial concentrates on how to achieve a higher business continuity with AKS.

# Tutorial

## Prerequisites
Recommendation: use Azure Cloud Shell. 

If you prefer to use your local environment the following tools are needed to conduct the tutorial:
- Azure CLI.
- Git.
- kubectl client.
- Terraform binary.

## 1. Clone Repository
Clone the repository to your local machine

```git
git clone https://github.com/abengtss-max/aksmultiregion.git
```

## 2. Create Resource Group
```bash
#!/bin/bash
RESOURCE_GROUP_NAME=tfstate

az group create --name $RESOURCE_GROUP_NAME --location westeurope
``` 

#### Note: In cloud shell, sessions will time out after some time. This means that environment variables will disappear. To work around this, you can save your variables to a file, and then restore them, using the following commands:

```bash
# Save envirnment variables
declare -px > env_vars.txt

# Restore environment variables
source env_vars.txt

```


## 3. Create Azure Keyvault
Lets create an Azure Keyvault to later store our Access key from storage account. 

```bash

KEYVAULT_NAME=keyvault$RANDOM

az keyvault create --name $KEYVAULT_NAME --resource-group $RESOURCE_GROUP_NAME --location "westeurope"
``` 
## 4. Configure Terraform Backend State
By default, Terraform state is stored locally, which isnt secure or ideal. lets create a storage account were we can securely store states and access it centrally.

Create storage account.

```bash
#!/bin/bash

STORAGE_ACCOUNT_NAME=tfstate$RANDOM
CONTAINER_NAME=tfstate

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
```  

Get the storage access key.
```bash
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY
``` 

To further protect the Azure Storage Account access key, store your access keys in the previously created Keyvault in previous step. For furher information please visit: https://learn.microsoft.com/en-us/azure/key-vault/secrets/quick-create-cli#add-a-secret-to-key-vault

```bash
az keyvault secret set --vault-name $KEYVAULT_NAME --name "testkey" --value $ACCOUNT_KEY
``` 
Verify that your secrets are stored in your Key vault.

## 5. Update Terraform Template
Update the provider.tf file with the correct storage account name ($STORAGE_ACCOUNT_NAME).

## 6. Deploy Infrastructure with Terraform

Initialize Terraform providers and backend.

```bash
terraform init
``` 
Validate the Terraform configuration.

```bash
terraform validate
```
Deploy the configuration.

```bash 
terraform plan 
terraform apply
terraform output
```

