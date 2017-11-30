#!/bin/bash

set -e

cd base
echo Bulding the base docker image...
docker build -t java-base:latest .

cd ../app
echo Building the application specific docker image...
docker build -t java-app:latest .

cd ..
echo Running the application specific image...
docker run -it --rm --memory=512m -p 8080:8080 java-app:latest