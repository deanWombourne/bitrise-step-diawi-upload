#!/usr/bin/env bash
#
# Uploads an ipa to Diawi
set -e

# Install the diawi binary if needed
which diawi >/dev/null 2>&1 || npm install -g diawi

# Create the command
cmd="diawi upload"

# If there is a password, add that to the command
if ! [[ -z "${password}" ]]; then
  cmd="${cmd} -p ${password}"
fi

# Add the required arguments
cmd="${cmd} ${api_token} ${filename}"

echo "Running command '${cmd}'"

# Run the command
diawi_url=`$cmd`
echo Diawi Upload URL is $diawi_url
envman add --key DIAWI_UPLOAD_URL --value "${diawi_url}"
