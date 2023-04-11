package com.example.att_itog.config;

import com.example.att_itog.services.PersonDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
    private final PersonDetailService personDetailService;

    // Здесь мы убираем шифрование паролей, это делается исключительно для тестирования
    @Bean
    public PasswordEncoder getPasswordEncode(){
        return NoOpPasswordEncoder.getInstance();

    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // конфигурируем работу спринг секьюрити

        http.csrf().disable() // отключаем защиту от межсайтовой подделки запросов
                .authorizeHttpRequests() // указываем что все страницы должны быть защищены аутентификацией

                // ниже указываем что не аутентифицированные пользователи могут зайти на страницу аутентификации
                // и на объект ошибки;
                // с помощью пермитола указываем, что не аутентифицированные пользователи могут заходить
                // на перечисленные страницы
                .requestMatchers("/authentication", "/error", "/registration").permitAll()

                // указываем, что для всех остальных страниц необходимо вызывать метод authenticated(),
                // который открывает форму аутентификации
                .anyRequest().authenticated()

                // указываем, что дальше настраивается аутентификация и соединяем ее с настройкой доступа (нд - всё что выше)
                .and()

                // указываем какой урл запрос будет отправляться при заходе на защищенные страницы
                .formLogin().loginPage("/authentication")

                // указываем на какой адрес будут отправляться данные с формы.
                // Нам уже не нужно будет создавать метод в контроллере и обрабатывать данные с формы.
                // Мы задали урл, который используется по умолчанию для обработки формы аутентификации спринг секьюрити.
                // Спринг сек. будет ждать объект с формы аутентификации и затем сверять логин и пароль в БД
                .loginProcessingUrl("/process_login")

                // Указываем на какой урл необходимо направить пользователя после успешной аутентификации.
                // Вторым аргументом указываем тру чтобы перенаправление шло в любом случае после успешной аутентификации
                .defaultSuccessUrl("/index", true)

                // Указываем куда необходимо перенаправить пользователя при правильной аутентификации.
                // В запрос буден передан еррор, который будет проверяться на форме и при наличии данного объекта в запросе
                // выводится сообщение "Неправильный логин или пароль"
                .failureUrl("/authentication?error")

                .and()
                // перенаправление пользователя на страницу аутентификации
                .logout().logoutUrl("/logout").logoutSuccessUrl("/authentication");

        return http.build();

    }

    public SecurityConfig(PersonDetailService personDetailService) {
        this.personDetailService = personDetailService;
    }

//    private final AuthenticationProvider authenticationProvider;

//    public SecurityConfig(AuthenticationProvider authenticationProvider) {
//        this.authenticationProvider = authenticationProvider;
//    }

    protected void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
//        authenticationManagerBuilder.authenticationProvider(authenticationProvider);
        authenticationManagerBuilder.userDetailsService(personDetailService);

    }
}
