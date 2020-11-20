#!/bin/sh
set +x
PROFILE='default'
REGION='us-east-1'
CF_REPO_BUCKET='dataops-12bd30f0'
TEMPLATE_FILE='stack.template'
OUTPUT_TEMPLATE_FILE='stack.yaml'

read -p "AWS Region [default=$REGION]: " -e input
REGION=${input:-$REGION}
read -p "AWS Profile [default=$PROFILE]: " -e input
PROFILE=${input:-$PROFILE}
read -p "CF Repository Bucket [default=$CF_REPO_BUCKET]: " -e input
CF_REPO_BUCKET=${input:-$CF_REPO_BUCKET}
read -p "Template File [default=$TEMPLATE_FILE]: " -e input
TEMPLATE_FILE=${input:-$TEMPLATE_FILE}
read -p "Output Template File [default=$OUTPUT_TEMPLATE_FILE]: " -e input
OUTPUT_TEMPLATE_FILE=${input:-$OUTPUT_TEMPLATE_FILE}

if [ -f template/$TEMPLATE_FILE ]; then
  aws cloudformation package --region $REGION --profile $PROFILE --s3-bucket $CF_REPO_BUCKET --template-file template/$TEMPLATE_FILE --output-template-file $OUTPUT_TEMPLATE_FILE
fi
