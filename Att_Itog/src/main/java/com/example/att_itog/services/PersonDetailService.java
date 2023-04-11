package com.example.att_itog.services;

import com.example.att_itog.models.Person;
import com.example.att_itog.repositories.PersonRepository;
import com.example.att_itog.security.PersonDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PersonDetailService implements UserDetailsService {
    private final PersonRepository personRepository;

    @Autowired
    public PersonDetailService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // Получаем пользователя из таблицы по логину с формы аутентификации
        Optional<Person> person = personRepository.findByLogin(username);

        // Проверяем найден пользователь или нет
        // Если пользователь не был найден, то выбрасываем исключение
        // Данное исключение будет поймано Спринг Секьюрити и сообщение будет выведено на страницу
        if(person.isEmpty()) {
            throw new UsernameNotFoundException("Пользователь не найден");
        }
        return new PersonDetails(person.get());
    }
}
