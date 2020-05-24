package com.taoding.oauth2resource.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName : ResourceController
 * @Description : test controller
 * @Author : Tao
 * @Email : 991104402@qq.com
 * @Date: 2020-05-24
 */
@RestController
public class ResourceController {

    @RequestMapping("/test")
    public String test() {
        return "Welcome to visit oauth2-resource !";
    }

    @RequestMapping(value = "/getResource", method = RequestMethod.GET)
    public String getResource() {
        return "You get it successfully !";
    }

    @RequestMapping(value = "/getAuthorizedResource", method = RequestMethod.GET)
    @PreAuthorize("hasRole('SystemUser')")
    public String getAuthorizedResource() {
        return "You get it successfully !";
    }

}
