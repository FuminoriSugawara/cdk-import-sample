
This repository is an example of how to bring existing AWS resources (S3 buckets) under CDK management using `cdk import`.

### How to Run
- Copy `config.json.sample` to create `config.json`.
- Run `create-sample-aws-resource.sh` to create an S3 bucket.
- Execute `cdk-bootstrap.sh`.
- Execute `cdk-import.sh`.
- Confirm that the S3 bucket is registered in the stack on the AWS Console CloudFormation page.