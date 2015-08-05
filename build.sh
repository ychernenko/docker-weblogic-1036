#!/usr/bin/env bash
source ./globals.sh
cd context
docker build --force-rm=true --no-cache=true --rm=true -t $IMAGE_NAME .
