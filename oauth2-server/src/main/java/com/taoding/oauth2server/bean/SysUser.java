package com.taoding.oauth2server.bean;

import lombok.Data;
import java.io.Serializable;

/**
 * @ClassName : SysUser
 * @Description : 用户实体类
 * @Author : Tao
 * @Email : 991104402@qq.com
 * @Date: 2020-05-24
 */
@Data
public class SysUser implements Serializable {

	private static final long serialVersionUID = 1L;

	private String userId;

	private String username;

	private String password;

	private String realname;

	private String mobile;

	private String idCard;

	private String address;

	private String email;

	private String loginTime;

	private String loginIp;

	private String locked;

}
