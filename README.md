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
### Step 2:

next, we'll build our jar using maven command:
```shell
$ mvn clean install
```
and we should see, under target who just created, a .jar file, which named by the artifact id and the version 
as we configured in pom.xml file.

### Step 3:

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
### Step 4:
now let's we build our image, we should navigate to the main folder 
of our project and to run this command:

```shell
$ docker build . 
```

this command will create our docker image according the information we provided 
in the Dockerfile.

### Step 5:
now, to run our image we should run this command:
```shell
$ docker run -p 8080:8080 docker-spring 
# or the name you gave to your image
# -p means publish, we define on which port our image instance will run 
```

### Step 6:

let's we test our image with curl command:
```shell
$ curl http://localhost:8080/
```

![This is an image](https://github.com/netanelshriki/docker-with-spring/blob/master/src/main/resources/static/curl-response-docker.png)
