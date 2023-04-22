package com.example.att_itog.repositories;


import com.example.att_itog.models.OrderPerson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Transactional
@Repository
public interface OrderPersonRepository extends JpaRepository<OrderPerson, Integer> {

    @Query(value = "select * from order_person where person_id = ?1", nativeQuery = true)
    List<OrderPerson> findOrdersByPersonId(int id);

    OrderPerson findOrderById(int id);

    void deletePersonOrderById(int id);

}
