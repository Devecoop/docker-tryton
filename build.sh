#!/bin/bash -x

REPO_USER="devecoop"
IMAGE_NAME="tryton"
CONTEXT_DIRS="3.2"

DOCKER_BIN=docker

for context_dir in $CONTEXT_DIRS; do
    tag_name=$(echo $context_dir | tr '/' '-')
    $DOCKER_BIN build -t $REPO_USER/${IMAGE_NAME}:$tag_name $context_dir
done
