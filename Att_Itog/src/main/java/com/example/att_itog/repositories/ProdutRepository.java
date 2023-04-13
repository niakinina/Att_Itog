package com.example.att_itog.repositories;

import com.example.att_itog.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProdutRepository extends JpaRepository<Product, Integer> {
}
