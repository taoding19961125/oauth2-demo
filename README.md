# oauth2-demo : A demo for Oauth2

## 项目介绍 

` oauth2-demo`项目是一套基于 Spring Security + Oauth2 + JWT 实现的简单认证授权单点登录系统 。

## 项目结构

```
oauth2-demo
├── oauth2-server -- 认证服务器：用于认证用户的服务器，如果客户端认证通过，发放访问资源服务器的令牌。
├── oauth2-resource -- 拥有受保护资源的服务器，如果请求包含正确的访问令牌，可以访问资源。
├── oauth2-client -- 客户端，会使用访问令牌去获取资源服务器的资源，可以是浏览器、移动设备或者服务器。
```



## 数据库表

官方：https://github.com/spring-projects/spring-security-oauth/blob/master/spring-security-oauth2/src/test/resources/schema.sql

- <font color='red'>注意：这个 sql 文件不能在 MySQL 中直接执行，需要更改部分字段值或类型 。</font>

```sql
-- used in tests that use HSQL
create table oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
);

create table oauth_client_token (
  token_id VARCHAR(256),
  token LONGVARBINARY,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);

create table oauth_access_token (
  token_id VARCHAR(256),
  token LONGVARBINARY,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication LONGVARBINARY,
  refresh_token VARCHAR(256)
);

create table oauth_refresh_token (
  token_id VARCHAR(256),
  token LONGVARBINARY,
  authentication LONGVARBINARY
);

create table oauth_code (
  code VARCHAR(256), authentication LONGVARBINARY
);

create table oauth_approvals (
	userId VARCHAR(256),
	clientId VARCHAR(256),
	scope VARCHAR(256),
	status VARCHAR(10),
	expiresAt TIMESTAMP,
	lastModifiedAt TIMESTAMP
);


-- customized oauth_client_details table
create table ClientDetails (
  appId VARCHAR(256) PRIMARY KEY,
  resourceIds VARCHAR(256),
  appSecret VARCHAR(256),
  scope VARCHAR(256),
  grantTypes VARCHAR(256),
  redirectUrl VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additionalInformation VARCHAR(4096),
  autoApproveScopes VARCHAR(256)
);
```

- **个人演示数据：存放于项目根目录下 schema.sql 文件**



## 演示

### 1. 客户端

- 启动 oauth2-server 服务和 oauth2-client 服务；
- 访问客户端需要授权的接口 http://localhost:8188/oauth2-client/getCurrentUser会跳转到授权服务的登录界面；

![1590333646735](.\images\1590333646735.png)

- 进行登录操作后跳转到授权页面； 

![1590333761672](.\images\1590333761672.png)

-  授权后会跳转到原来需要权限的接口地址，展示登录用户信息； 

![1590333823994](.\images\1590333823994.png)

- 如果需要跳过授权操作进行自动授权可以添加`autoApprove(true)`配置（我们这里是从数据库中更改oauth_client_details 表字段 autoapprove 为 true ;



### 2.资源服务器

- 启动 oauth2-server 服务和 oauth2-resource 服务；

- 访问 http://localhost:8088/oauth2-server/oauth/authorize?client_id=taoding&response_type=code&scope=all&redirect_url=http://www.baidu.com ，登陆操作后重定向并获取 code 。

  ![1590334213989](.\images\1590334213989.png)

  ![1590334256950](.\images\1590334256950.png)

- 使用 postman ，以授权码模式，填上返回的 code ,请求获取 token 。

![1590334372828](.\images\1590334372828.png)

- 携带 token ,访问资源服务器下接口 。

  ![1590334479383](.\images\1590334479383.png)



## 更多例子，请自行调试操作 ...