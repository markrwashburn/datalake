#!/bin/sh
set +x
STACK_NAME='DataLake'
TEMPLATE_FILE='stack.yaml'

read -p "Stack Name [default=$STACK_NAME]: " -e input
STACK_NAME=${input:-$STACK_NAME}
read -p "Template File [default=$TEMPLATE_FILE]: " -e input
TEMPLATE_FILE=${input:-$TEMPLATE_FILE}

if [ -f $TEMPLATE_FILE ]; then
  aws cloudformation deploy --template-file $TEMPLATE_FILE --stack-name $STACK_NAME --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND
fi
