package com.metro;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.metro")
public class MetroManagementSpringBootWebAppApplication {

    public static void main(String[] args) {
        SpringApplication.run(MetroManagementSpringBootWebAppApplication.class, args);
    }

}
