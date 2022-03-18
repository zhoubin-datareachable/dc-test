#!/bin/sh
set -e

# dockerfile构建项目
build() {
    echo "===start==="
    BUILDPARAMS=""
    CONTEXT="."
    cp /Dockerfile ./
    cp /nginx.conf ./nginx.conf
    cp /.dockerignore ./.dockerignore
    local BUILD_TAGS=""
    for TAG in ${TAGS}; do
        BUILD_TAGS="${BUILD_TAGS}-t ${INPUT_NAME}:${TAG} "
    done
    docker build ${BUILDPARAMS} ${BUILD_TAGS} ${CONTEXT}
}

build
