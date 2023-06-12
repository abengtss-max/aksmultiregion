# AKS Multi-Region
The code base contains a sample solution for establishing a high available AKS cluster in Azure, by using AKS in multiple region and diverting the traffic by usage of Azure front door.

## Introduction
By default, AKS provides high availability by using multiple nodes in a Virtual Machine Scale Set (VMSS). But these multiple nodes don’t protect your system from a region failure. This tutorial concentrates on how to achieve a higher business continuity with AKS.

# Tutorial

## 1. Clone repository
Clone the repository to your local machine

```git
git clone https://github.com/abengtss-max/aksmultiregion.git
```

## 2. Configure Terraform Backend State
By default, Terraform state is stored locally, which isnt secure or ideal. lets create a storage account were we can securely store states and access it centrally.

Create storage account.

```bash
#!/bin/bash

RESOURCE_GROUP_NAME=tfstate
STORAGE_ACCOUNT_NAME=tfstate$RANDOM
CONTAINER_NAME=tfstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location westeurope

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


```bash
export ARM_ACCESS_KEY=$(az keyvault secret show --name terraform-backend-key --vault-name myKeyVault --query value -o tsv)
``` 