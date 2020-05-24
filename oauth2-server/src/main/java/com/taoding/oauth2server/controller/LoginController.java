package com.taoding.oauth2server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName : LoginController
 * @Description : Test login
 * @Author : Tao
 * @Email : 991104402@qq.com
 * @Date: 2020-05-24
 */
@RestController
public class LoginController {

    @RequestMapping("/login")
    public String index() {
        return "Hello world!";
    }

}
