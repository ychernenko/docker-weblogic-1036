#!/usr/bin/env bash
source ./globals.sh
(docker images | grep $IMAGE_REPOSITORY | awk '{print $3}' | xargs docker rmi) || :