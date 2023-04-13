package com.example.att_itog.repositories;

import com.example.att_itog.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
    com.example.att_itog.models.Category findByName(String name);
}
