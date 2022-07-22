package net.dev.dockerWithSpring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
