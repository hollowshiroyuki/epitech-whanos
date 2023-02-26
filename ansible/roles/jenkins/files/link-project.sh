#!/bin/bash

if [[ -f app/main.bf ]]; then
    lang="befunge"

elif [[ -f Makefile ]]; then
    lang="c"

elif [[ -f app/pom.xml ]]; then
    lang="java"

elif [[ -f package.json ]]; then
    lang="javascript"

elif [[ -f requirements.txt ]]; then
    lang="python"

else
    exit 1
fi

if [[ -f Dockerfile ]]; then
    docker build . -t whanos-$lang-$1
    docker tag whanos-$lang-$1 $REGISTRY/whanos-$lang-$1
    docker push $REGISTRY/whanos-$lang-$1
else
    docker build . -f /var/jenkins_home/images/$lang/Dockerfile.standalone -t whanos-$lang-standalone
    docker tag whanos-$lang-standalone $REGISTRY/whanos-$lang-standalone
    docker push $REGISTRY/whanos-$lang-standalone
fi
