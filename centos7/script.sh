#!/bin/bash

DATE=$(date +%H-%M-%S)
BACKUP=db-$DATE.sql
HOST=$1
DBPASS=$2
DBNAME=$3
AWS_KEY=$4
BUCKET_NAME=$5

mysqldump --column-statistics=0  -u root -h $HOST -p$DBPASS $DBNAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=AKIAVKYVKIMDH5FA7MY6 && \
export AWS_SECRET_ACCESS_KEY=$AWS_KEY && \
echo "Uploading DB" && \
aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET_NAME/$BACKUP





