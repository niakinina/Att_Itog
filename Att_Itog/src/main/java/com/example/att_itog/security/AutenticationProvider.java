package com.example.att_itog.security;

import com.example.att_itog.services.PersonDetailService;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Collections;

@Component
public class AutenticationProvider implements AuthenticationProvider {

    private final PersonDetailService personDetailService;

    public AutenticationProvider(PersonDetailService personDetailService) {
        this.personDetailService = personDetailService;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        // Получаем логин с формы аутентификации
        // За нас Спринг Секьюрити сам создаст объект формы и передаст его в объект аутентификации
        String login = authentication.getName();

        // Т.к.данный метод возвращает объект интерфейса UserDetails, то и объект мы создадим через интерфейс
        UserDetails person = personDetailService.loadUserByUsername(login);

        String password = authentication.getCredentials().toString();


        if(!password.equals(person.getPassword())){
            throw new BadCredentialsException("Не корректный пароль");
        }

        return new UsernamePasswordAuthenticationToken(person, password, Collections.emptyList());

    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}
