package com.example.att_itog.controllers;

import com.example.att_itog.models.Category;
import com.example.att_itog.models.Product;
import com.example.att_itog.repositories.CategoryRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AdminController {

    @Value("${upload.path}")
    private String uploadPath;
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

    @PostMapping("/admin/product/add")
    public String addProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult,
                             @RequestParam("file_one")MultipartFile file_one,
                             @RequestParam("file_two")MultipartFile file_two,
                             @RequestParam("file_three")MultipartFile file_three,
                             @RequestParam("file_four")MultipartFile file_four,
                             @RequestParam("file_five")MultipartFile file_five,
                             @RequestParam("category") int category, Model model){
        Category category_db = (Category) categoryRepository.findById(category).orElseThrow();
        System.out.println(category_db.getName());
        if (bindingResult.hasErrors()) {
            model.addAttribute("category", categoryRepository.findAll());
            return "product/addProduct";
        }
        return null;
    }

    @GetMapping("/admin")
    public String admin(){
        return "admin";
    }

}
