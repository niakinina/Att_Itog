package com.example.att_itog.controllers;

import com.example.att_itog.config.SecurityConfig;
import com.example.att_itog.security.PersonDetails;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class MainController {
    @GetMapping("/index")
    public String index() {
        // Получаем объект аутентификации
        // с помощью спрингконтекстхолдер обращаемся к контексту и на нем вызываем метод аутентификации
        // Из сессии текуего пользователя получаем объект, кот. был положен в данную сесию после аутентиф-ии пользователя
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PersonDetails personDetails = (PersonDetails) authentication.getPrincipal();
        System.out.println(personDetails.getPerson());
        System.out.println("ID пользователя: " + personDetails.getPerson().getId());
        System.out.println("Логин пользователя: " + personDetails.getPerson().getLogin());
        System.out.println("Пароль пользователя: " + personDetails.getPerson().getPassword());

        return "index";

    }
}
