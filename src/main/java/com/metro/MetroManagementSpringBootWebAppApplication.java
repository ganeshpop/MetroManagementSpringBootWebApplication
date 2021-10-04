package com.metro;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication(scanBasePackages = "com.metro")
public class MetroManagementSpringBootWebAppApplication {

    public static void main(String[] args) {
        ApplicationContext applicationContext = SpringApplication.run(MetroManagementSpringBootWebAppApplication.class, args);
        for(String name: applicationContext.getBeanDefinitionNames()){
            System.out.println("--> " + name );
        }

    }

}
