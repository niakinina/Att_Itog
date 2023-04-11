package com.example.att_itog.security;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

@Component
public class AutenticationProvider implements AuthenticationProvider {
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        // Получаем логин с формы аутентификации
        // За нас Спринг Секьюрити сам создаст объект формы и передаст его в объект аутентификации
        String login = authentication.getName();

    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}
