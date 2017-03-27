#! /bin/bash

echo "PATHHHH"
pwd

tag="${CI_SO}${CI_SO_VER}_jdk1.${CI_JAVA_MAJOR}_py${CI_PY_VER}"
dockerfile_folder="../Dockerfiles/${CI_SO}${CI_SO_VER}/jdk1.${CI_JAVA_MAJOR}/py${CI_PY_VER}"
dockerfile_path="${dockerfile_folder}/Dockerfile"
mkdir -p $dockerfile_folder
cp "../templates/${CI_SO}" dockerfile_path

ci_env_vars=`env | awk 'match($0, /(CI_.*)=/) {print substr($0, RSTART, RLENGTH-1)}'`

for var_name in $ci_env_vars; do
    sed -e "s/:${var_name}:/${!var_name}/g" $dockerfile_path > $dockerfile_path
done

docker build base:${tag} $dockerfile_path

