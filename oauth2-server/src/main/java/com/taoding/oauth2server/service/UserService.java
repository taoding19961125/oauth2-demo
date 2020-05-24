package com.taoding.oauth2server.service;

import com.taoding.oauth2server.bean.SysPermission;
import com.taoding.oauth2server.bean.SysUser;
import com.taoding.oauth2server.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName : UserService
 * @Description : 获取用户信息和权限信息
 * @Author : Tao
 * @Email : 991104402@qq.com
 * @Date: 2020-05-24
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public List<SysUser> getUserByName(String username) {
        return userMapper.getUserByName(username);
    }

    public List<SysPermission> getPermissionByUserId(String userId) {
        return userMapper.getPermissionByUserId(userId);
    }

}
