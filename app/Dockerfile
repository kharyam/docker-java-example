FROM java-base:latest

ENV BUILD_DIR=/tmp/s2i-java

# Run as an unprivileged user. This ensures OpenShift Support.
RUN useradd demo -u 1001 -g 0
USER 1001

RUN mkdir ${BUILD_DIR} && \
    git clone https://github.com/jorgemoralespou/s2i-java ${BUILD_DIR}

RUN cd ${BUILD_DIR}/test/test-app-maven && \
    mvn clean package && \
    mv target/*.jar $JAR_DIR && \
    rm -fr ~/.m2/repository/* && \
    rm -fr /tmp/s2i-java
