#!/usr/bin/env bash

#use builtkit https://github.com/moby/buildkit
export DOCKER_BUILDKIT=1
#brew install buildkit
#sudo buildkit
#see https://medium.com/capital-one-tech/multi-stage-builds-and-dockerfile-b5866d9e2f84
#docker rmi example-maven:latest
docker build -t example-maven:latest .
#docker build --target gitclone -t example-maven:latest .
#docker build --target build -t example-maven:latest .
#docker build --target run -t example-maven:latest .

docker images --filter label=test=true --format ‘{{.CreatedAt}}\t{{.ID}}’ | sort -nr | head -n 1 | cut -f2

docker run --rm   example-maven:latest
