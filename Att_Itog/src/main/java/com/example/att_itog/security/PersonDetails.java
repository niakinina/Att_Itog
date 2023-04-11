package com.example.att_itog.security;

import com.example.att_itog.models.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

public class PersonDetails implements UserDetails {
    private final Person person;

    public PersonDetails(Person person) {
        this.person = person;
    }

    public Person getPerson() {
        return this.person;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getPassword() {
        return this.person.getPassword();
    }

    @Override
    public String getUsername() {
        return this.person.getLogin();
    }


    // Позволяет проверить действительность аккаунта
    // Аккаунт действителен
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    // Позволяет проверить является ли аккаунт заблокированным или нет
    // Аккаунт не заблокирован
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    // Позволяет проверить действительность пароля
    // Пароль является действительным
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    // Позволяет проверить является ли активным аккаунт или его не активировали
    // Аккаунт активен
    @Override
    public boolean isEnabled() {
        return true;
    }
}
