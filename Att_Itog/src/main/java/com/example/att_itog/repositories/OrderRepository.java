package com.example.att_itog.repositories;


import com.example.att_itog.models.Order;
import com.example.att_itog.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findByPerson(Person person);

    List<Order> findByNumberEndingWith(String endingWith);
}
