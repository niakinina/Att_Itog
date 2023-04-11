package com.example.att_itog.config;

import com.example.att_itog.services.PersonDetailService;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfiguration{
    private final PersonDetailService personDetailService;

    public SecurityConfig(PersonDetailService personDetailService) {
        this.personDetailService = personDetailService;
    }

//    private final AuthenticationProvider authenticationProvider;

//    public SecurityConfig(AuthenticationProvider authenticationProvider) {
//        this.authenticationProvider = authenticationProvider;
//    }

    protected void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
//        authenticationManagerBuilder.authenticationProvider(authenticationProvider);
        authenticationManagerBuilder.userDetailsService(personDetailService);

    }
}
