package com.taoding.oauth2client.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName : LoginController
 * @Description : Test login
 * @Author : Tao
 * @Email : 991104402@qq.com
 * @Date: 2020-05-24
 */
@RestController
public class TestController {

    @RequestMapping(value = "test", method = RequestMethod.GET)
    public String test() {
        return "index";
    }

    @RequestMapping(value = "getCurrentUser", method = RequestMethod.GET)
    public Object getCurrentUser(Authentication authentication) {
        return authentication;
    }

    @RequestMapping(value = "principal", method = RequestMethod.GET)
    public Object getPrincipal() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return principal;
    }

    @RequestMapping(value = "roles", method = RequestMethod.GET)
    public Object getRoles() {
        return SecurityContextHolder.getContext().getAuthentication().getAuthorities();
    }

}
