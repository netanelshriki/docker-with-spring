# Dockerizing spring boot App:

### Step 1:

lets we build a simple spring server : 


```java
@SpringBootApplication
@RestController
public class DockerWithSpringApplication {

    public static void main(String[] args) {
        SpringApplication.run(DockerWithSpringApplication.class, args);
    }


    @RequestMapping("/")
    public String home() {
        return "Hello Docker World";
    }

}

```

next, we'll build our jar using maven command:
```shell
$ mvn clean install
```
and we should see, under target who just created, a .jar file, which named by the artifact id and the version 
as we configured in pom.xml file.
now, after we have the jar, we want the build a docker image from this jar
and we can do it by creating a Dockerfile in the main directory as following:


```Dockerfile
FROM amazoncorretto:11-alpine-jdk
# use jdk 11 for this jar we have created

COPY target/dockerWithSpring-0.0.1-SNAPSHOT.jar docker-spring-0.0.1.jar
# cop the jar we created to new jar and give him the new name we want, OLD: target/dockerWithSpring-0.0.1-SNAPSHOT.jar
# NEW: docker-spring-0.0.1.jar

ENTRYPOINT ["java","-jar","/docker-spring-0.0.1.jar"]
# the script we want to run when the program is booting
# notice, the entrypoint is defined as array 
```