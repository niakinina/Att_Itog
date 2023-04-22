package com.example.att_itog.controllers;

import com.example.att_itog.enumm.Status;
import com.example.att_itog.models.Cart;
import com.example.att_itog.models.Order;
import com.example.att_itog.models.Person;
import com.example.att_itog.models.Product;
import com.example.att_itog.repositories.CartRepository;
import com.example.att_itog.repositories.OrderRepository;
import com.example.att_itog.repositories.ProductRepository;
import com.example.att_itog.security.PersonDetails;
import com.example.att_itog.services.PersonService;
import com.example.att_itog.services.ProductService;
import com.example.att_itog.util.PersonValidator;
import jakarta.validation.Valid;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Controller
public class MainController {

    private final ProductRepository productRepository;

    private final PersonValidator personValidator;

    private final PersonService personService;

    private final ProductService productService;

    private final CartRepository cartRepository;

    private final OrderRepository orderRepository;

    public MainController(ProductRepository productRepository, PersonValidator personValidator, PersonService personService, ProductService productService, CartRepository cartRepository, OrderRepository orderRepository) {
        this.productRepository = productRepository;
        this.personValidator = personValidator;
        this.personService = personService;
        this.productService = productService;
        this.cartRepository = cartRepository;
        this.orderRepository = orderRepository;
    }

    @GetMapping("/person account")
    public String index(Model model) {
        // Получаем объект аутентификации
        // с помощью спрингконтекстхолдер обращаемся к контексту и на нем вызываем метод аутентификации
        // Из сессии текуего пользователя получаем объект, кот. был положен в данную сесию после аутентиф-ии пользователя
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PersonDetails personDetails = (PersonDetails) authentication.getPrincipal();
        String role = personDetails.getPerson().getRole();
        if(role.equals("ROLE_ADMIN")){
            return "redirect:/admin";
        }
//        System.out.println(personDetails.getPerson());
//        System.out.println("ID пользователя: " + personDetails.getPerson().getId());
//        System.out.println("Логин пользователя: " + personDetails.getPerson().getLogin());
//        System.out.println("Пароль пользователя: " + personDetails.getPerson().getPassword());
        model.addAttribute("products", productService.getAllProduct());
        return "/user/index";

    }

    @GetMapping("/registration")
    public String registration(@ModelAttribute("person") Person person){
        return "registration";
    }

    @PostMapping("/registration")
    public String resultRegistration(@ModelAttribute("person") @Valid Person person, BindingResult bindingResult){
       personValidator.validate(person, bindingResult);
        if(bindingResult.hasErrors()){
           return "registration";
       }
       personService.register(person);
        return "redirect:/person account";
    }


    @GetMapping("/person account/product/info/{id}")
    public String infoProduct(@PathVariable("id") int id, Model model){
        model.addAttribute("product", productService.getProductId(id));
        return "/user/infoProduct";
    }

    @PostMapping("/person account/product/search")
    public String productSearch(@RequestParam("search") String search, @RequestParam("ot") String ot, @RequestParam("do") String Do, @RequestParam(value = "price", required = false, defaultValue = "") String price, @RequestParam(value = "contract", required = false, defaultValue = "")String contract, Model model){
        model.addAttribute("products", productService.getAllProduct());

        if(!ot.isEmpty() & !Do.isEmpty()){
            if (!price.isEmpty()){
                if(price.equals("sorted_by_ascending_price")){
                    if(!contract.isEmpty()){
                        if(contract.equals("accessories")){
                            model.addAttribute("search_product",
                                    productRepository
                                            .findByTitleAndCategoryOrderByPriceAsc(search.toLowerCase(),
                                                    Float.parseFloat(ot),
                                                    Float.parseFloat(Do), 1));
                        } else if (contract.equals("food")){
                            model.addAttribute("search_product",
                                    productRepository
                                            .findByTitleAndCategoryOrderByPriceAsc(search.toLowerCase(),
                                                    Float.parseFloat(ot),
                                                    Float.parseFloat(Do), 3));
                        } else if (contract.equals("toppings")) {
                            model.addAttribute("search_product",
                                    productRepository
                                            .findByTitleAndCategoryOrderByPriceAsc(search.toLowerCase(),
                                                    Float.parseFloat(ot),
                                                    Float.parseFloat(Do), 2));
                        }
                    } else {
                        model.addAttribute("search_product",
                                productRepository
                                        .findByTitleOrderByPriceAsc(search.toLowerCase(),
                                                Float.parseFloat(ot),
                                                Float.parseFloat(Do)));
                    }

                } else if(price.equals("sorted_by_descending_price")){
                    if(!contract.isEmpty()){
                        if(contract.equals("accessories")){
                            model.addAttribute("search_product",
                                    productRepository
                                            .findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(),
                                                    Float.parseFloat(ot),
                                                    Float.parseFloat(Do), 1));
                        } else if (contract.equals("food")){
                            model.addAttribute("search_product",
                                    productRepository
                                            .findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(),
                                                    Float.parseFloat(ot),
                                                    Float.parseFloat(Do), 3));
                        } else if (contract.equals("toppings")) {
                            model.addAttribute("search_product",
                                    productRepository
                                            .findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(),
                                                    Float.parseFloat(ot),
                                                    Float.parseFloat(Do), 2));
                        }
                    } else {
                        model.addAttribute("search_product",
                                productRepository
                                        .findByTitleOrderByPriceDesc(search.toLowerCase(),
                                                Float.parseFloat(ot),
                                                Float.parseFloat(Do)));
                    }
                }
            } else {
                model.addAttribute("search_product", productRepository
                        .findByTitleAndPriceGreaterThanEqualAndPriceLessThanEqual(search.toLowerCase(),
                                Float.parseFloat(ot),
                                Float.parseFloat(Do)));
            }
        } else {
            model.addAttribute("search_product", productRepository.findByTitleContainingIgnoreCase(search));
        }

        model.addAttribute("value_search", search);
        model.addAttribute("value_price_ot", ot);
        model.addAttribute("value_price_do", Do);
        return "/user/index";

    }

    @GetMapping("/cart/add/{id}")
    public String addProductInCart(@PathVariable("id") int id, Model model){
        // Получаем продукт по ид
        Product product = productService.getProductId(id);

        // Извлекаем объект аутентифицированного пользователя
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PersonDetails personDetails = (PersonDetails) authentication.getPrincipal();

        // Извлекаем ид пользователя из объекта аутентификации
        int id_person = personDetails.getPerson().getId();
        Cart cart = new Cart(id_person, product.getId());
        cartRepository.save(cart);
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String cart(Model model){
        // Извлекаем объект аутентифицированного пользователя
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PersonDetails personDetails = (PersonDetails) authentication.getPrincipal();

        // Извлекаем ид пользователя из объекта аутентификации
        int id_person = personDetails.getPerson().getId();

        List<Cart> cartList = cartRepository.findByPersonId(id_person);
        List<Product> productList = new ArrayList<>();

        //Перебираем всё что лежит в корзине
        //Получаем продукты(товары) из корзины по ид товара
        for (Cart cart: cartList){
            productList.add(productService.getProductId(cart.getProductId()));
        }

        // Вычисляем итоговую цену
        // Перебираем и прибавляем к цене
        float price = 0;
        for (Product product: productList){
            price += product.getPrice();
        }

        model.addAttribute("price", price);
        model.addAttribute("cart_product", productList);
        return "/user/cart";
    }

    @GetMapping("/cart/delete/{id}")
    public String deleteProductFromCart(Model model, @PathVariable("id") int id){
        // Извлекаем объект аутентифицированного пользователя
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PersonDetails personDetails = (PersonDetails) authentication.getPrincipal();

        // Извлекаем ид пользователя из объекта аутентификации
        int id_person = personDetails.getPerson().getId();
        // Получаем то что есть в корзине по айди пользователя
        List<Cart> cartList = cartRepository.findByPersonId(id_person);
        List<Product> productList = new ArrayList<>();

        //Перебираем всё что лежит в корзине
        //Получаем продукты(товары) из корзины по ид товара
        for (Cart cart: cartList) {
            productList.add(productService.getProductId(cart.getProductId()));
        }
        cartRepository.deleteCartByProductId(id);
        return "redirect:/cart";
    }

    @GetMapping("/order/create")
    public String order(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PersonDetails personDetails = (PersonDetails) authentication.getPrincipal();

        // Извлекаем ид пользователя из объекта аутентификации
        int id_person = personDetails.getPerson().getId();

        List<Cart> cartList = cartRepository.findByPersonId(id_person);
        List<Product> productList = new ArrayList<>();

        //Перебираем всё что лежит в корзине
        //Получаем продукты(товары) из корзины по ид товара
        for (Cart cart: cartList){
            productList.add(productService.getProductId(cart.getProductId()));
        }

        // Вычисляем итоговую цену
        // Перебираем и прибавляем к цене
        float price = 0;
        for (Product product: productList){
            price += product.getPrice();
        }

        String uuid = UUID.randomUUID().toString();
        for(Product product : productList){
            Order newOrder = new Order(uuid, product, personDetails.getPerson(), 1, product.getPrice(), Status.Оформлен);
            orderRepository.save(newOrder);
            cartRepository.deleteCartByProductId(product.getId());
        }
        return "redirect:/orders";

    }

    @GetMapping("/orders")
    public String orderUser(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PersonDetails personDetails = (PersonDetails) authentication.getPrincipal();
        List<Order> orderList = orderRepository.findByPerson(personDetails.getPerson());
        model.addAttribute("orders", orderList);
        return "/user/orders";
    }

}


//    Idea-773c22b1=639b8f8c-8d9a-4480-a41f-522765673695;
//    JSESSIONID=49DE616E7D880C4FE8ACF0FBFCE1F021

//    Idea-773c22b1=639b8f8c-8d9a-4480-a41f-522765673695;
//    JSESSIONID=E3ED64F5AAE307AEC14B9305530EFB5A