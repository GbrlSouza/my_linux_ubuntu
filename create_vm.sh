#!/bin/bash

AMI_ID="ami-0abcdef1234567890"
INSTANCE_TYPE="t2.micro"
KEY_NAME="my-key-pair"
SECURITY_GROUP="default"
REGION="us-east-1"

aws ec2 run-instances \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-groups $SECURITY_GROUP \
  --region $REGION \
  --output table
