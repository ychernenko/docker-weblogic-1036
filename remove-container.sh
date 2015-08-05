#!/usr/bin/env bash
source ./globals.sh
(docker ps -a | grep $IMAGE_NAME | awk '{print $1}' | xargs docker rm) || :