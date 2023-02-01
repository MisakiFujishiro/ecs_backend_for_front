package org.debugroom.mynavi.sample.ecs.backendforfront.config;

import org.debugroom.mynavi.sample.ecs.backendforfront.app.web.ServiceProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestOperations;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@ComponentScan("org.debugroom.mynavi.sample.ecs.backendforfront.app.web")
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Autowired
    ServiceProperties properties;

    @Bean
    public RestOperations restOperations(RestTemplateBuilder restTemplateBuilder){
       return restTemplateBuilder.rootUri(properties.getDns()).build();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }

}