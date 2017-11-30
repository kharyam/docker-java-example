from centos:centos7

ENV EXECUTABLE_DIR=/opt/run-java
ENV JAR_DIR=/opt/run-java
ENV EXECUTABLE=${EXECUTABLE_DIR}/run-java.sh

EXPOSE 8080

RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel maven git wget && yum clean all
RUN mkdir ${EXECUTABLE_DIR}
RUN wget https://github.com/fabric8io-images/run-java-sh/raw/master/fish-pepper/run-java-sh/fp-files/run-java.sh -O ${EXECUTABLE}
RUN chgrp -R 0 ${EXECUTABLE_DIR} && chmod -R 770 ${EXECUTABLE_DIR}

CMD  ${EXECUTABLE}
