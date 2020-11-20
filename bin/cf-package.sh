#!/bin/sh
set +x
S3_BUCKET_NAME='dataops-12bd30f0'
TEMPLATE_FILE='stack.template'
OUTPUT_TEMPLATE_FILE='stack.yaml'

read -p "S3 Bucket Name [default=$S3_BUCKET_NAME]: " -e input
S3_BUCKET_NAME=${input:-$S3_BUCKET_NAME}
read -p "Template File [default=$TEMPLATE_FILE]: " -e input
TEMPLATE_FILE=${input:-$TEMPLATE_FILE}
read -p "Output Template File [default=$OUTPUT_TEMPLATE_FILE]: " -e input
OUTPUT_TEMPLATE_FILE=${input:-$OUTPUT_TEMPLATE_FILE}

if [ -f template/$TEMPLATE_FILE ]; then
  aws cloudformation package --template-file template/$TEMPLATE_FILE --s3-bucket $S3_BUCKET_NAME --output-template-file $OUTPUT_TEMPLATE_FILE
fi
