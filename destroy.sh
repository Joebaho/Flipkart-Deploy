#!/bin/bash

set -e

ENVIRONMENT=${ENVIRONMENT:-Testing}
AWS_REGION=${AWS_REGION:-us-west-2}

echo "🗑️ Destroying Flipkart infrastructure..."

read -p "❓ Are you sure? (type 'yes' to confirm): " confirm
if [ "$confirm" != "yes" ]; then
    echo "❌ Cancelled"
    exit 1
fi

terraform destroy -auto-approve -var="environment=$ENVIRONMENT" -var="aws_region=$AWS_REGION"

echo "✅ Infrastructure destroyed"