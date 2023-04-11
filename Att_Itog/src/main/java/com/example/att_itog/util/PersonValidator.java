package com.example.att_itog.util;

import com.example.att_itog.models.Person;
import com.example.att_itog.services.PersonService;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class PersonValidator implements Validator {

    private final PersonService personService;

    public PersonValidator(PersonService personService) {
        this.personService = personService;
    }

    // В данном методе указываем для какой модели предназначен данный валидатор
    @Override
    public boolean supports(Class<?> clazz) {
        return Person.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Person person = (Person) target;
        if (personService.findByLogin(person) != null){
            errors.rejectValue("login", "", "Данный логин уже зарегистрирован в системе");
        }
    }
}
