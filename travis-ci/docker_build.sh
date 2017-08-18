#! /bin/bash

template_folder="./source/${CI_BASE_IMAGE}"
tag="${CI_BASE_IMAGE}${CI_BASE_VER}"

dockerfile_folder="./Dockerfiles/${CI_BASE_IMAGE}${CI_BASE_VER}/${CI_IMAGE_NAME}"
dockerfile_path="${dockerfile_folder}/Dockerfile"

mkdir -p $dockerfile_folder

cp ./source/${CI_BASE_IMAGE}/* ${dockerfile_folder}/
cp ./source/common/* ${dockerfile_folder}/

ci_env_vars=`env | awk 'match($0, /(CI_.*)=/) {print substr($0, RSTART, RLENGTH-1)}'`

for var_name in $ci_env_vars; do
    sed -i.bak "s/:${var_name}:/${!var_name}/g" $dockerfile_path
done

rm -rf "${dockerfile_path}.bak"

docker build --tag "gibdbigdata/${CI_IMAGE_NAME}:${tag}" $dockerfile_folder

