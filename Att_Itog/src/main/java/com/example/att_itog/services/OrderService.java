package com.example.att_itog.services;

import com.example.att_itog.models.Order;
import com.example.att_itog.repositories.OrderRepository;
import com.example.att_itog.repositories.PersonRepository;
import com.example.att_itog.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;


@Service
@Transactional(readOnly = true)
public class OrderService {
    private final OrderRepository orderRepository;

    private final ProductRepository productRepository;

    private final PersonRepository personRepository;

    public OrderService(OrderRepository orderRepository, ProductRepository productRepository, PersonRepository personRepository) {
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
        this.personRepository = personRepository;
    }

    // Данный метод возвращает все заказы
    public List<Order> getAllOrders() { return orderRepository.findAll(); }


    // Данный метод позволяет обновить данные пользователя
    @Transactional
    public void deleteOrder(int id) { orderRepository.deleteById(id); }

    @Transactional
    public void editStatusOrder(int id, Order order){
        order.setId(id);
        orderRepository.save(order);
    }
}
