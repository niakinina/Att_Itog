package com.example.att_itog.services;

import com.example.att_itog.models.Category;
import com.example.att_itog.models.Product;
import com.example.att_itog.repositories.ProdutRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class ProductService {
    private final ProdutRepository produtRepository;

    public ProductService(ProdutRepository produtRepository) {
        this.produtRepository = produtRepository;
    }

    // Данный метод позволит получить список всех товаров
    public List<Product> getAllProduct(){
        return produtRepository.findAll();
    }

    // Данный метод позволяет получить товар по айди
    public Product getProduct(int id){
        Optional<Product> optionalProduct = produtRepository.findById(id);
        return optionalProduct.orElse(null);
    }

    // Данный метод позволяет сохранить товар
    @Transactional
    public void saveProduct(Product product, Category category){
        product.setCategory(category);
        produtRepository.save(product);
    }

    // Данный метод позволяет обновить данные о товаре
    @Transactional
    public void updateProduct(int id, Product product){
        product.setId(id);
        produtRepository.save(product);
    }

    // Данный метод позволяет удалить товар по айди
    @Transactional
    public void deleteProduct(int id){
        produtRepository.deleteById(id);
    }
}
