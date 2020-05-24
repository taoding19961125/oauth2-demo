package com.taoding.oauth2server.mapper;

import com.taoding.oauth2server.bean.SysPermission;
import com.taoding.oauth2server.bean.SysUser;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName : UserMapper
 * @Description : UserMapper
 * @Author : Tao
 * @Email : 991104402@qq.com
 * @Date: 2020-05-24
 */
@Mapper
@Repository
public interface UserMapper {

    @Select("select * from t_user where username = #{username} ")
    @Results({
            @Result(property = "userId", column = "user_id"),
            @Result(property = "idCard", column = "id_card"),
            @Result(property = "loginTime", column = "login_time"),
            @Result(property = "loginIp", column = "login_ip")
    })
    List<SysUser> getUserByName(String username);

    @Select("SELECT p.* FROM t_user u " +
            "LEFT JOIN t_user_role ur ON u.user_id = ur.user_id " +
            "LEFT JOIN t_role r ON ur.role_id = r.role_id " +
            "LEFT JOIN t_role_permission rp ON r.role_id = rp.role_id " +
            "LEFT JOIN t_permission p ON rp.permission_id = p.id where u.user_id = #{userId} ")
    @Results({
            @Result(property = "parentId", column = "parent_id"),
            @Result(property = "createTime", column = "create_time"),
            @Result(property = "updateTime", column = "update_time")

    })
    List<SysPermission> getPermissionByUserId(@Param("userId") String userId);

}
