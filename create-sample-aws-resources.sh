#!/bin/bash

set -e

source ./json-utils.sh

# Check if aws cli is installed
if [ -z $(which aws) ]; then
  echo "aws cli is not installed"
  exit 1
fi

aws --version

# Load config.json
CONFIG_FILE=./config.json

AWS_PROFILE=$(get_json_value $CONFIG_FILE '.awsProfile.provision')
BUCKET_NAME=$(get_json_value $CONFIG_FILE '.s3.bucketName')

if [ -z $AWS_PROFILE ]; then
  echo "AWS_PROFILE is not set"
  exit 1
fi
echo AWS_PROFILE=$AWS_PROFILE

if [ -z $BUCKET_NAME ]; then
  echo "BUCKET_NAME is not set"
  exit 1
fi
echo BUCKET_NAME=$BUCKET_NAME

aws s3 mb s3://$BUCKET_NAME \
--profile $AWS_PROFILE \
> "output/s3-$BUCKET_NAME.json"


