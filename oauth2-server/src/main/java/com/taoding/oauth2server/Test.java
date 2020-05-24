package com.taoding.oauth2server;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @ClassName : Test
 * @Description :
 * @Author : Tao
 * @Date: 2020-05-24 00:12
 */
public class Test {

    public static void main(String[] args) {

        String pass = "123456";
        BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
        String hashPass = bcryptPasswordEncoder.encode(pass);
        System.out.println(hashPass);

    }

}
