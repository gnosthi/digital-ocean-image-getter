#!/bin/bash

TOKEN_FILE=${1}

if [[ -z ${1} ]]; then
    echo "No API Token File supplied"
    exit 1
fi

#Pull DigitalOcean Images using API token and parse them with jq.
curl -X GET --silent "https://api.digitalocean.com/v2/images?per_page=999" -H "Authorization: Bearer $(cat ${TOKEN_FILE})" | jq '.'
