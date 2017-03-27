#! /bin/bash

set -eu

message="Hello World"
image_tag="${CI_SO}${CI_SO_VER}_jdk1.${CI_JAVA_MAJOR}_py${CI_PY_VER}"
image_name="base:${image_tag}"

docker run --name ${image_tag} ${image_name} echo ${message}

docker ps --all --filter 'exited=0' --filter "image=${image_name}" | grep -v "CONTAINER ID"