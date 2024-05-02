#!/bin/bash

WORLD_NAME="happyserver"
RESOURCE_GROUP_NAME="${WORLD_NAME}-tfstate"
STORAGE_ACCOUNT_NAME="${WORLD_NAME}tfstate"
CONTAINER_NAME="tfstate"

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

# get the storage access key and store it as an environment variable
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY