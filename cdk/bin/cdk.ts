#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from 'aws-cdk-lib';
import { CdkImportSampleStack } from '../lib/cdkImportSampleStack';

const app = new cdk.App();
new CdkImportSampleStack(app, 'CdkImportSampleStack', {
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION,
  },
});

