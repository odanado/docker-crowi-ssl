#!/bin/bash
set -eu
echo "VIRTUAL_HOST = $VIRTUAL_HOST"
envsubst < "template.yml" > "docker-compose.yml"
docker-compose up -d
