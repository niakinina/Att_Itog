package com.example.att_itog.controllers;

import com.example.att_itog.models.Person;
import com.example.att_itog.security.PersonDetails;
import com.example.att_itog.services.PersonService;
import com.example.att_itog.util.PersonValidator;
import jakarta.validation.Valid;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class MainController {

    private final PersonValidator personValidator;

    private final PersonService personService;

    public MainController(PersonValidator personValidator, PersonService personService) {
        this.personValidator = personValidator;
        this.personService = personService;
    }

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

    //    @GetMapping("/registration")
    //    public String registration(Model model){
    //        model.addAttribute("person", new Person());
    //        return "registration";
    //    }

    @GetMapping("/registration")
    public String registration(@ModelAttribute("person") Person person){
        return "registration";
    }

    @PostMapping("/registration")
    public String resultRegistration(@ModelAttribute("person") @Valid Person person, BindingResult bindingResult){
       personValidator.validate(person, bindingResult);
        if(bindingResult.hasErrors()){
           return "/registration";
       }
       personService.register(person);
        return "redirect:/index";
    }

//    Idea-773c22b1=639b8f8c-8d9a-4480-a41f-522765673695;
//    JSESSIONID=49DE616E7D880C4FE8ACF0FBFCE1F021

    Idea-773c22b1=639b8f8c-8d9a-4480-a41f-522765673695;
    JSESSIONID=E3ED64F5AAE307AEC14B9305530EFB5A
}
