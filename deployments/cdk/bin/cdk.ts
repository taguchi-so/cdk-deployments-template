#!/usr/bin/env node
import "source-map-support/register";
import cdk = require("@aws-cdk/core");
import { CdkStack } from "../lib/cdk-stack";
import * as path from "path";

const app = new cdk.App();
const env: string = app.node.tryGetContext("env");
const name: string =
  app.node.tryGetContext("name") || path.basename(path.resolve("../../"));

new CdkStack(app, `${name}-${env || "dev"}`, {
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION
  }
});
