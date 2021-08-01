SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
                            `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
                            `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
                            `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
                            `password_salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '盐值',
                            `user_identify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标识',
                            `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
                            `user_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_permision
-- ----------------------------
DROP TABLE IF EXISTS `sys_permision`;
CREATE TABLE `sys_permision` (
                                 `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                 `permision_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限名称',
                                 `permision_parent_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上层权限uid',
                                 `permision_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限类型',
                                 `permision_sort` int(10) DEFAULT NULL COMMENT '排序',
                                 `permision_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限url',
                                 `permision_related_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联权限路径',
                                 `permision_desc` text COLLATE utf8_unicode_ci COMMENT '描述',
                                 PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
                            `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                            `role_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
                            `role_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色描述',
                            PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sys_role_permision
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permision`;
CREATE TABLE `sys_role_permision` (
                                      `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                      `role_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色uid',
                                      `permision_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限uid',
                                      PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
                                 `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                 `user_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                                 `role_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                                 PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
