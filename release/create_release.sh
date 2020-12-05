#!/bin/bash

NUMBER_ARG=$#
if [ $NUMBER_ARG -lt 2 ]
then
  echo "usage: create_release.sh <version> <branch>"
  exit 1
fi

if [ -z ${TOKEN+x} ]
then
  echo "TOKEN is unset"
  exit 2
fi

VERSION=$1
BRANCH=$2

echo "Creating release for version=$VERSION, branch=$BRANCH"

SERVER=https://api.github.com

OUTPUT=$(curl -s -H "Authorization: token ${TOKEN}" \
  -d '{
  "tag_name": "v'"${VERSION}"'",
  "name": "'"${VERSION}"'"
}' \
${SERVER}/repos/korshavn/unison-homepage/releases)

echo OUTPUT ${OUTPUT}

RELEASE_UPLOAD_URL=$(echo $OUTPUT | jq '.upload_url')
RELEASE_ID=$(echo $OUTPUT | jq '.id')

echo ::set-output name=release_upload_url::${RELEASE_UPLOAD_URL}
echo ::set-output name=release_id::${RELEASE_ID}

