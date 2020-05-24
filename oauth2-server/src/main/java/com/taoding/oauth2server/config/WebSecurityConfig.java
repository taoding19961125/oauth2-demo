package com.taoding.oauth2server.config;

import com.taoding.oauth2server.bean.SysPermission;
import com.taoding.oauth2server.bean.SysUser;
import com.taoding.oauth2server.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;
import java.util.List;


/**
 * @ClassName : WebSecurityConfig
 * @Description : WebSecurityConfig
 * @Author : Tao
 * @Email : 991104402@qq.com
 * @Date: 2020-05-24
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserService userService;

    /**
     * 密码编码器
     * 支持 BCrypt、Ldap、MD4、MD5、noop、pbkdf2、scrypt、SHA-1、SHA-256、sha256 等加密方式
     *
     * @return
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        AuthenticationManager manager = super.authenticationManagerBean();
        return manager;
    }

    /**
     * 配置用户信息服务
     *
     * @return
     */
    @Bean
    @Override
    public UserDetailsService userDetailsService() {
        return new UserDetailsService() {
            @Override
            public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
                List<SysUser> userList = userService.getUserByName(username);
                if (userList == null || userList.size() != 1) {
                    return null;
                }
                SysUser sysUser = (SysUser) userList.get(0);
                List<GrantedAuthority> grantedAuthorities = new ArrayList();
                if (sysUser != null) {
                    //  获取用户授权
                    List<SysPermission> sysPermissions = userService.getPermissionByUserId(sysUser.getUserId());
                    //  声明用户授权
                    sysPermissions.forEach(sysPermission -> {
                        if (sysPermission != null && sysPermission.getEnname() != null) {
                            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(sysPermission.getEnname());
                            grantedAuthorities.add(grantedAuthority);
                        }
                    });
                }
                return new User(sysUser.getUsername(), sysUser.getPassword(), grantedAuthorities);
            }
        };
    }

    /**
     * 安全拦截机制
     *
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/**").authenticated()
                .anyRequest().permitAll()
                .and()
                .formLogin()
                .and()
                .logout();
    }

    /**
     * 放行机制
     *
     * @param web
     * @throws Exception
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/oauth/check_token");
    }

}
