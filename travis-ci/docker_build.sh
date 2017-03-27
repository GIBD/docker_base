#! /bin/bash

tag="${CI_SO}${CI_SO_VER}_jdk1.${CI_JAVA_MAJOR}_py${CI_PY_VER}"
dockerfile_folder="./Dockerfiles/${CI_SO}${CI_SO_VER}/jdk1.${CI_JAVA_MAJOR}/py${CI_PY_VER}"
dockerfile_path="${dockerfile_folder}/Dockerfile"
mkdir -p $dockerfile_folder
cp "./templates/${CI_SO}" dockerfile_path

ci_env_vars=`env | awk 'match($0, /(CI_.*)=/) {print substr($0, RSTART, RLENGTH-1)}'`

for var_name in $ci_env_vars; do
    sed -e "s/:${var_name}:/${!var_name}/g" $dockerfile_path > $dockerfile_path
done

echo catting docker file path
cat $dockerfile_path
echo catted docker file path
echo ci env vars
echo $ci_env_vars
echo ci env vars echoed


docker build "${CI_IMAGE_NAME}:${tag}" $dockerfile_path

