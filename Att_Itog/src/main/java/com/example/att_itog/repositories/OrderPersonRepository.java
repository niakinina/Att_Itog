package com.example.att_itog.repositories;


import com.example.att_itog.models.OrderPerson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;



@Transactional
@Repository
public interface OrderPersonRepository extends JpaRepository<OrderPerson, Integer> {
}
