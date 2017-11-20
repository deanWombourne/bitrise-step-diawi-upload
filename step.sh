#!/usr/bin/env bash
#
# Uploads an ipa to Diawi
set -e

which diawi >/dev/null 2>&1 || npm install -g diawi
diawi_url=$(diawi upload "${api_token}" "${filename}")
envman add --key DIAWI_UPLOAD_URL --value "${diawi_url}"
