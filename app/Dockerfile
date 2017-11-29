FROM java-base:latest

ENV BUILD_DIR=/tmp/s2i-java

RUN mkdir ${BUILD_DIR} && \
    git clone https://github.com/jorgemoralespou/s2i-java ${BUILD_DIR}

RUN cd ${BUILD_DIR}/test/test-app-maven && \
    mvn clean package &&\
    cp target/*.jar $JAR_DIR
