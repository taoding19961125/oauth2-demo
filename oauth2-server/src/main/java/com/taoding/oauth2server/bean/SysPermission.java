package com.taoding.oauth2server.bean;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName : SysPermission
 * @Description : 权限实体类
 * @Author : Tao
 * @Email : 991104402@qq.com
 * @Date: 2020-05-24
 */
@Data
public class SysPermission implements Serializable {

    private Long id;

    private Long parentId;

    private String name;

    private String enname;

    private String description;

    private Date createTime;

    private Date updateTime;

    private static final long serialVersionUID = 1L;

}
