# Docker Base Image for Java

This project provides a simplified example for creating a Java (JDK 8) base image for docker that honors memory limits.

## Project Contents

* The *base* directory contains a Dockerfile used to build the base Java image. For convenience in this example, maven, git and the JDK are installed as well to facilitate builds. The container runs as an unprivilged user in group 0 to ensure OpenShift support.

* The *app* directory Dockerfile builds from the base image to deploy a simple spring boot app, pulling it from github and building it from maven. 

* The test.sh script builds both images, then runs the application image.  The command line passed to the JVM indicates the amount of memory computed (256m) which honors the limit specified in the docker command line (`docker run -it --rm --memory=512m ...`).  It is set to half of the memory allocated, calculated heuristically by the run-java.sh script. The factor can be tuned via an environment variable, 50% is the default. Once the app is running, it can be visited via http://localhost:8080 Details on the run-java.sh script used to handle memory limits can be found in it's GitHub repository:

    https://github.com/fabric8io-images/run-java-sh

    Several other environment variables can be used to customize the behavior of the script, including the ability to pass in *JAVA_OPTIONS* to explicitly set JVM parameters.

## Example Output

Sample output after running *test.sh* (on a linux system with docker installed). Note the `-Xmx256m` parameter was dynamically computed and passed to the JVM based on the container memory limit in the docker command.

        # ./test.sh
        Bulding the base docker image...
        Sending build context to Docker daemon  2.56 kB
        Step 1/12 : FROM centos:centos7
        ...
        Successfully built dfac95c491c9
        Building the application specific docker image...
        Sending build context to Docker daemon 2.048 kB
        Step 1/4 : FROM java-base:latest
        ...
        Successfully built 1e5a9c1d3a78
        Running the application specific image...
        exec java -Xmx256m -XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -XX:        +ExitOnOutOfMemoryError -XX:MinHeapFreeRatio=20 -XX:MaxHeapFreeRatio=40 -cp . -jar      /opt/run-java/gs-spring-boot-docker-0.1.0.jar

          .   ____          _            __ _ _
         /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
        ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
         \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
          '  |____| .__|_| |_|_| |_\__, | / / / /
         =========|_|==============|___/=/_/_/_/
         :: Spring Boot ::        (v1.2.5.RELEASE)
        2017-11-30 15:57:13.311  INFO 1 --- [           main] hello.Application                        : Starting Application v0.1.0 on c1807e4fdea9 with PID 1         (/opt/run-java/gs-spring-boot-docker-0.1.0.jar started by demo in /opt/run-java)
        ...
        2017-11-30 15:57:15.330  INFO 1 --- [           main] s.b.c.e.t.TomcatEmbeddedServletContainer : Tomcat started on port(s): 8080 (http)
        ...
        2017-11-30 15:57:15.331  INFO 1 --- [           main] hello.Application                        : Started Application in 2.218 seconds (JVM running for 2.504)