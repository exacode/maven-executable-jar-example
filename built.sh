#!/usr/bin/env bash

#see https://medium.com/capital-one-tech/multi-stage-builds-and-dockerfile-b5866d9e2f84
docker rmi example-maven:latest
docker build -t example-maven:latest .
#docker build --target gitclone -t example-maven:latest .
#docker build --target build -t example-maven:latest .
#docker build --target run -t example-maven:latest .
docker run --rm  -w /tmp example-maven:latest java -jar /tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar