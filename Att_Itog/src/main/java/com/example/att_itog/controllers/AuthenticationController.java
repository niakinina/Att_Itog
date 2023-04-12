package com.example.att_itog.controllers;

import com.example.att_itog.models.Person;
import com.example.att_itog.repositories.CategoryRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class AuthenticationController {

    private final CategoryRepository

    @GetMapping("/authentication")
    public String login(){
        return "authentication";
    }


}
