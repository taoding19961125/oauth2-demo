/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : taoding

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 24/05/2020 
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token`  (
  `token_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authentication` blob NULL,
  `refresh_token` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals`  (
  `userId` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clientId` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expiresAt` datetime(0) NULL DEFAULT NULL,
  `lastModifiedAt` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('taoding', 'resource_1', '$2a$10$BwjUFy2wia9nrIf4WvWokuWl4Uo22IkOKWEMdFu9OZu6V8U1NUnz2', 'all', 'password,authorization_code,refresh_token,implicit,client_credentials', '', '', 7200, 259200, NULL, 'true');
INSERT INTO `oauth_client_details` VALUES ('test', 'resource_2', '$2a$10$YeK/8drqzjoGu70iUVzGeeUdIrNqo35AM6RJ9b3TrI3M.eAcsTotC', 'all', 'password,authorization_code,refresh_token,implicit,client_credentials', 'http://www.baidu.com', '', 60, 3600, NULL, 'false');

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token`  (
  `token_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code`  (
  `code` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token`  (
  `token_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父权限',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `enname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限英文名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '授权路径',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, 0, '系统管理', 'System', '/', NULL, '2019-04-04 23:22:54', '2019-04-04 23:22:56');
INSERT INTO `t_permission` VALUES (2, 1, '用户管理', 'SystemUser', '/users/', NULL, '2019-04-04 23:25:31', '2019-04-04 23:25:33');
INSERT INTO `t_permission` VALUES (3, 1, '内容管理', 'SystemContent', '/contents/', NULL, '2019-04-06 18:23:58', '2019-04-06 18:24:00');
INSERT INTO `t_permission` VALUES (4, 2, '查看用户', 'SystemUserView', '/users/view/**', NULL, '2019-04-04 15:30:30', '2019-04-04 15:30:43');
INSERT INTO `t_permission` VALUES (5, 2, '新增用户', 'SystemUserInsert', '/users/insert/**', NULL, '2019-04-04 15:30:31', '2019-04-04 15:30:44');
INSERT INTO `t_permission` VALUES (6, 2, '编辑用户', 'SystemUserUpdate', '/users/update/**', NULL, '2019-04-04 15:30:32', '2019-04-04 15:30:45');
INSERT INTO `t_permission` VALUES (7, 2, '删除用户', 'SystemUserDelete', '/users/delete/**', NULL, '2019-04-04 15:30:48', '2019-04-04 15:30:45');
INSERT INTO `t_permission` VALUES (8, 3, '查看内容', 'SystemContentView', '/contents/view/**', NULL, '2019-04-06 23:49:39', '2019-04-06 23:49:41');
INSERT INTO `t_permission` VALUES (9, 3, '新增内容', 'SystemContentInsert', '/contents/insert/**', NULL, '2019-04-06 23:51:00', '2019-04-06 23:51:02');
INSERT INTO `t_permission` VALUES (10, 3, '编辑内容', 'SystemContentUpdate', '/contents/update/**', NULL, '2019-04-06 23:51:04', '2019-04-06 23:51:06');
INSERT INTO `t_permission` VALUES (11, 3, '删除内容', 'SystemContentDelete', '/contents/delete/**', NULL, '2019-04-06 23:51:08', '2019-04-06 23:51:10');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('48f33a7ac7db40849133c6b68a9ff818', '超级管理员', '超级管理员', '2019-05-02 17:22:22');
INSERT INTO `t_role` VALUES ('d43d99f066e745c3867ff26d4c7a357b', '普通用户', '普通用户', '2019-05-02 14:40:53');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色 ID',
  `permission_id` bigint(20) NOT NULL COMMENT '权限 ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES (1, '48f33a7ac7db40849133c6b68a9ff818', 1);
INSERT INTO `t_role_permission` VALUES (2, '48f33a7ac7db40849133c6b68a9ff818', 2);
INSERT INTO `t_role_permission` VALUES (3, '48f33a7ac7db40849133c6b68a9ff818', 3);
INSERT INTO `t_role_permission` VALUES (4, '48f33a7ac7db40849133c6b68a9ff818', 4);
INSERT INTO `t_role_permission` VALUES (5, '48f33a7ac7db40849133c6b68a9ff818', 5);
INSERT INTO `t_role_permission` VALUES (6, '48f33a7ac7db40849133c6b68a9ff818', 6);
INSERT INTO `t_role_permission` VALUES (7, '48f33a7ac7db40849133c6b68a9ff818', 7);
INSERT INTO `t_role_permission` VALUES (8, '48f33a7ac7db40849133c6b68a9ff818', 8);
INSERT INTO `t_role_permission` VALUES (9, '48f33a7ac7db40849133c6b68a9ff818', 9);
INSERT INTO `t_role_permission` VALUES (10, '48f33a7ac7db40849133c6b68a9ff818', 10);
INSERT INTO `t_role_permission` VALUES (11, '48f33a7ac7db40849133c6b68a9ff818', 11);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_card` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `locked` int(1) NULL DEFAULT NULL,
  `login_time` datetime(0) NULL DEFAULT NULL,
  `login_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('332bcfdf32554d51afe2da527be46c39', 'liubei', '123456', '刘备', '18938299832', '312113121313131231', 'liubei@126.com', '河北涿州', 0, '2019-05-16 21:13:24', NULL);
INSERT INTO `t_user` VALUES ('92f87753890146e4abf75fa299e10cdc', 'zhangfei', '$2a$10$lzjDbLznpUCr3T0V8qPjguXuI4Rlt0494cCP6kFsxdmr9bd9OxLc6', '张飞', '18811112222', '312113121313131231', 'zhangfei@126.com', '河北涿州', 0, '2019-05-19 13:44:49', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES ('d9e5ff37d7f348ef8b33f78bdbee3ae1', 'admin', '$2a$10$lzjDbLznpUCr3T0V8qPjguXuI4Rlt0494cCP6kFsxdmr9bd9OxLc6', '管理员', '18912341234', '312113121313131231', 'admin@qq.com', '上海', 0, '2019-05-31 14:30:07', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES ('db8b18ad43f148df87fdecf30c5a0437', 'guanyu', '$2a$10$lzjDbLznpUCr3T0V8qPjguXuI4Rlt0494cCP6kFsxdmr9bd9OxLc6', '关羽', '15934563456', '312113121313131231', 'guanyu@126.com', '山西运城', 0, '2019-05-16 21:13:24', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 'd9e5ff37d7f348ef8b33f78bdbee3ae1', '48f33a7ac7db40849133c6b68a9ff818');
INSERT INTO `t_user_role` VALUES (2, '92f87753890146e4abf75fa299e10cdc', 'd43d99f066e745c3867ff26d4c7a357b');
INSERT INTO `t_user_role` VALUES (3, 'db8b18ad43f148df87fdecf30c5a0437', 'd43d99f066e745c3867ff26d4c7a357b');
INSERT INTO `t_user_role` VALUES (4, '332bcfdf32554d51afe2da527be46c39', 'd43d99f066e745c3867ff26d4c7a357b');

SET FOREIGN_KEY_CHECKS = 1;
