#!/bin/bash

set -e

source ./json-utils.sh

CONFIG_FILE=./config.json

AWS_PROFILE=$(get_json_value $CONFIG_FILE '.awsProfile.deploy')

if [ -z $AWS_PROFILE ]; then
  echo "AWS_PROFILE is not set"
  exit 1
fi
echo AWS_PROFILE=$AWS_PROFILE

cd ./cdk

cdk import --profile $AWS_PROFILE