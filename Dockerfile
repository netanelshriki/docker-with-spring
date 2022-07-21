FROM amazoncorretto:11-alpine-jdk
# use jdk 11 for this jar we have created

COPY target/dockerWithSpring-0.0.1-SNAPSHOT.jar docker-spring-0.0.1.jar
# cop the jar we created to new jar and give him the new name we want, OLD: target/dockerWithSpring-0.0.1-SNAPSHOT.jar
# NEW: docker-spring-0.0.1.jar

ENTRYPOINT ["java","-jar","/docker-spring-0.0.1.jar"]
# the script we want to run when the program is booting
# notice, the entrypoint is defined as array
