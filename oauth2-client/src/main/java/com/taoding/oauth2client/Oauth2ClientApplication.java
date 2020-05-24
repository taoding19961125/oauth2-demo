package com.taoding.oauth2client;

import com.taoding.oauth2client.config.CorsConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.context.annotation.Import;

@SpringBootApplication
@Import({CorsConfig.class})
@EnableOAuth2Sso
public class Oauth2ClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(Oauth2ClientApplication.class, args);
    }

}
