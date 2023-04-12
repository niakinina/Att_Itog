package com.example.att_itog.controllers;

import com.example.att_itog.models.Product;
import com.example.att_itog.repositories.CategoryRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
    private final CategoryRepository categoryRepository;

    public AdminController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("admin/product/add")
    public String addProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("category", categoryRepository.findAll());
        return "product/addProduct";
    }

    @GetMapping("/admin")
    public String admin(){
        return "admin";
    }

}
