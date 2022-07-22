[![CI with Maven](https://github.com/netanelshriki/docker-with-spring/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/netanelshriki/docker-with-spring/actions/workflows/main.yml)

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
        return "Hello Docker";
    }

}

```
### Step 2:

next, we'll build our jar using maven command:
```shell
mvn clean install
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
docker build -t docker-spring . 
# -t, means the tag (name) we want to give to our image
```

this command will create our docker image according the information we provided 
in the Dockerfile.

### Step 5:
now, to run our image we should run this command:
```shell
docker run -p 8080:8080 docker-spring 
# or the name you gave to your image
# -p means publish, we define on which port our image instance will run 
```

### Step 6:

let's we test our image with curl command:
```shell
curl http://localhost:8080/
```
and this is the response:  
![This is an image](https://github.com/netanelshriki/docker-with-spring/blob/master/src/main/resources/static/curl-response-docker.png)

congratulations! now you have built your first docker image :muscle:

# Publish Docker image to dockerhub:

> for the next steps, i assume you have created already a dockerhub account

### Step 1:

first we should to log in to our dockerhub account, let's we run this command:

```shell
docker login
```

and we specify our username and password.

### Step 2:

we build our image tag locally, in the way we want see it in our dockerhub repository, "our-username/our-image"
for instance - netanel123/docker-spring (in my case).
to build this tag we run the following command: 

```shell
docker tag docker-spring netanel123/docker-spring
# docker tag <my image>  <my username>/<my image>
# this will generate a new image - netanel123/docker-spring, unlike just docker-spring before.
```
let's we check our images:

```shell
docker images
```

and indeed, image netanel123/docker-spring built in addition to docker-spring


![This is an image](https://github.com/netanelshriki/docker-with-spring/blob/master/src/main/resources/static/docker-images.png)


now we almost finished, and we have just to push our image to dockerhub:

```shell
docker push netanel123/docker-spring
```

we can also specify a specific tag as following

```shell
docker push netanel123/docker-spring:myTag
```
if we will not do it, our image will get by default the tag - :latest

and you are done! you just pushed your first docker image to [dockerhub repository](https://hub.docker.com/repositories/netanel123) :partying_face:






