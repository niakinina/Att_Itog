package com.example.att_itog.controllers;

import com.example.att_itog.models.Product;
import com.example.att_itog.repositories.CategoryRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthenticationController {



    @GetMapping("/authentication")
    public String login(){
        return "/authentication";
    }





}
