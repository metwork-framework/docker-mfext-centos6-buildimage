#!/bin/bash

if test "${DOCKER_PASSWORD}" = "" -o "${DOCKER_USERNAME}" = ""; then
    echo "no release because DOCKER_PASSWORD or DOCKER_USERNAME is empty"
    exit 0
fi

if test "${TRAVIS}" = "true"; then
    # This is a travis build
    if test "${TRAVIS_EVENT_TYPE}" != "push"; then
        echo "no release because TRAVIS_EVENT_TYPE=${TRAVIS_EVENT_TYPE} != push"
        exit 0
    fi
fi

docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"
docker push ${1}:${2}
