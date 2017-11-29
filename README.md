# Docker Base Image for Java

This project provides a simplified example for creating a Java (JDK 8) base image for docker that honors memory limits.

The *base* directory contains a Dockerfile used to build the base Java image.

The *app* directory Dockerfile builds from the base image to deploy a simple spring boot app, pulling it from github and building it from maven.

The test.sh script builds both images, then runs the application image.  The command line used to run the app indicates the amount of memory compunted (256m) which honors the limit specified in the docker command line.  It is set to half of the memory allocated, calaculated heuristically by the script.  Details on the run-java.sh script can be found in it's GitHub repository:

https://github.com/fabric8io-images/run-java-sh