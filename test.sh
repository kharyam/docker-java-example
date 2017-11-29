#!/bin/bash

set -e

cd base
docker build -t java-base:latest .

cd ../app
docker build -t java-app:latest .

cd ..

docker run -it --rm --memory=512m -p 8080:8080 java-app:latest