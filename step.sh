#!/bin/bash
set -ex

set -o pipefail

npm install -g diawi

URL=`diawi upload ${api_token} ${filename}`

envman add --key DIAWI_UPLOAD_URL --value $URL
