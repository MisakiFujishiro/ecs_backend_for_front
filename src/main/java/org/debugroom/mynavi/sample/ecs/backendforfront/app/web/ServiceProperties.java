package org.debugroom.mynavi.sample.ecs.backendforfront.app.web;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component 
@ConfigurationProperties(prefix="service")//allication.ymlのserviceデータを取得する
public class ServiceProperties {
	
	private String dns;
	
	
}
