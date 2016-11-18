#!/bin/bash
set -eu
envsubst < "template.yml" > "docker-compose.yml"
docker-compose up -d
