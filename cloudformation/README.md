Title: cloudformation
Description:
This is an CloudFormation template that provisions static AWS infrastructure.

How to run it:
- There are a couple of ways you can build a CloudFormation stack
    1. via the AWS console.
        - Navigate to the CloudFormation service
        - Click "Create stack (With new resources)"
        - Upload the template file and create stack
    2. via the AWS CLI.
        - In the directory containing the CloudFormation template, type 'aws cloudformation deploy --template-file cloudformation.json --stack-name <stack_name>'
        - Note: "create-stack" can be used in place of "deploy"