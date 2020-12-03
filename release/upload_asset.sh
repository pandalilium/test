#!/bin/bash

NUMBER_ARG=$#
if [ $NUMBER_ARG -lt 3 ]
then
  echo "usage: upload_asset.sh <version> <upload_url> <file>"
  exit 1
fi

if [ -z ${TOKEN+x} ]
then
  echo "TOKEN is unset"
  exit 2
fi

VERSION=$1
URL=$2
FILE=$3

URL="${URL/\{?name,label\}/}"
CONTENT_TYPE=$(file -b --mime-type $FILE)

echo "Uploading asset for release version=$VERSION, file=$FILE, url=$URL"
echo "Content type: $CONTENT_TYPE"

OUTPUT=$(curl -s \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: $CONTENT_TYPE" \
    --data-binary @$FILE \
    "$URL?name=$(basename $FILE)")

echo "OUTPUT was $OUTPUT"

