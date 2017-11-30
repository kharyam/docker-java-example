FROM java-base:latest

ENV BUILD_DIR=/tmp/s2i-java

RUN mkdir ${BUILD_DIR} && \
    git clone https://github.com/jorgemoralespou/s2i-java ${BUILD_DIR}

RUN cd ${BUILD_DIR}/test/test-app-maven && \
    mvn clean package && \
    mv target/*.jar $JAR_DIR && \
    rm -fr ~/.m2/repository/* && \
    rm -fr /tmp/s2i-java
