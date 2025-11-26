#!/bin/bash

set -e  # Exit on error

# Configuration
ENVIRONMENT=${ENVIRONMENT:-Testing}
AWS_REGION=${AWS_REGION:-us-west-2}

echo "🚀 Starting deployment - Environment: $ENVIRONMENT, Region: $AWS_REGION"

# Check prerequisites
echo "📋 Checking prerequisites..."
command -v terraform >/dev/null 2>&1 || { echo "❌ Terraform not installed"; exit 1; }
command -v aws >/dev/null 2>&1 || { echo "❌ AWS CLI not installed"; exit 1; }

# Initialize Terraform
echo "🔧 Initializing Terraform..."
terraform init

# Create plan
echo "📝 Creating deployment plan..."
terraform plan -var="environment=$ENVIRONMENT" -var="aws_region=$AWS_REGION" -out=tfplan

# Apply changes
echo "🛠️ Applying infrastructure..."
terraform apply -auto-approve tfplan

# Show outputs
echo "📊 Deployment outputs:"
terraform output

echo "✅ Deployment completed successfully!"