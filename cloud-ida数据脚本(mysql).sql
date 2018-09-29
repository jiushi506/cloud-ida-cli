-- --------------------------------------------------------
-- 主机:                           10.0.8.197
-- 服务器版本:                        10.1.9-MariaDBV1.0R050D002-20170809-1522 - Source distribution
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 cloud-ida 的数据库结构
CREATE DATABASE IF NOT EXISTS `cloud-ida` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cloud-ida`;

-- 导出  表 cloud-ida.ida_permission 结构
CREATE TABLE IF NOT EXISTS `ida_permission` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) DEFAULT NULL,
  `permission_url` varchar(255) DEFAULT NULL,
  `parent_permission_id` int(11) DEFAULT NULL,
  `permission_lv` int(11) DEFAULT NULL,
  `permission_auth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  cloud-ida.ida_permission 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `ida_permission` DISABLE KEYS */;
INSERT INTO `ida_permission` (`permission_id`, `permission_name`, `permission_url`, `parent_permission_id`, `permission_lv`, `permission_auth`) VALUES
	(1, '用户管理', NULL, 0, 1, ''),
	(2, '新增修改', '/user-post', 1, 2, 'upost'),
	(3, '列表查询', '/user-get', 1, 2, 'uget'),
	(4, '删除用户', '/user/{id}-delete', 1, 2, 'udelete'),
	(5, '角色管理', NULL, 0, 1, ''),
	(6, '新增修改', '/role-post', 5, 2, 'rpost'),
	(7, '列表查询', '/role-get', 5, 2, 'rget'),
	(8, '删除角色', '/role/{id}-delete', 5, 2, 'rdelete'),
	(9, '角色授权', '/role-authorization-post', 5, 2, 'rauth'),
	(10, '权限管理', NULL, 0, 1, ''),
	(11, '新增修改', '/permission-post', 10, 2, 'ppost'),
	(12, '列表查询', '/permission-get', 10, 2, 'pget'),
	(13, '删除权限', '/permission/{id}-delete', 10, 2, 'pdelete'),
	(14, '预览权限', '/permission-view-get', 10, 2, 'pview');
/*!40000 ALTER TABLE `ida_permission` ENABLE KEYS */;

-- 导出  表 cloud-ida.ida_role 结构
CREATE TABLE IF NOT EXISTS `ida_role` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  cloud-ida.ida_role 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `ida_role` DISABLE KEYS */;
INSERT INTO `ida_role` (`role_id`, `role_name`) VALUES
	(1, '用户管理员'),
	(2, '角色管理员'),
	(3, '权限管理员'),
	(4, '超级管理员');
/*!40000 ALTER TABLE `ida_role` ENABLE KEYS */;

-- 导出  表 cloud-ida.ida_role_permission 结构
CREATE TABLE IF NOT EXISTS `ida_role_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  cloud-ida.ida_role_permission 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `ida_role_permission` DISABLE KEYS */;
INSERT INTO `ida_role_permission` (`id`, `role_id`, `permission_id`) VALUES
	(1, 4, 2),
	(2, 4, 3),
	(3, 4, 4),
	(4, 4, 6),
	(5, 4, 7),
	(6, 4, 8),
	(7, 4, 9),
	(8, 4, 11),
	(9, 4, 12),
	(10, 4, 13),
	(11, 4, 14),
	(12, 1, 1),
	(13, 1, 2);
/*!40000 ALTER TABLE `ida_role_permission` ENABLE KEYS */;

-- 导出  表 cloud-ida.ida_user 结构
CREATE TABLE IF NOT EXISTS `ida_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_role_names` varchar(255) DEFAULT NULL,
  `user_account` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  cloud-ida.ida_user 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `ida_user` DISABLE KEYS */;
INSERT INTO `ida_user` (`user_id`, `user_name`, `user_role_names`, `user_account`, `user_password`) VALUES
	(1, '许耀辉', '超级管理员', 'admin', '123456'),
	(2, '用户管理员', '用户管理员', 'user', '123456');
/*!40000 ALTER TABLE `ida_user` ENABLE KEYS */;

-- 导出  表 cloud-ida.ida_user_role 结构
CREATE TABLE IF NOT EXISTS `ida_user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  cloud-ida.ida_user_role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `ida_user_role` DISABLE KEYS */;
INSERT INTO `ida_user_role` (`id`, `user_id`, `role_id`) VALUES
	(1, 1, 4),
	(2, 2, 1);
/*!40000 ALTER TABLE `ida_user_role` ENABLE KEYS */;

-- 导出  表 cloud-ida.permission 结构
CREATE TABLE IF NOT EXISTS `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) DEFAULT NULL,
  `permission_url` varchar(255) DEFAULT NULL,
  `parent_permission_id` int(11) DEFAULT NULL,
  `permission_lv` int(255) DEFAULT '0' COMMENT '1为1级 2为2级',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- 正在导出表  cloud-ida.permission 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`permission_id`, `permission_name`, `permission_url`, `parent_permission_id`, `permission_lv`) VALUES
	(1, '用户管理', NULL, 0, 1),
	(2, '新增修改', '/user-post', 1, 2),
	(3, '列表查询', '/user-get', 1, 2),
	(4, '删除用户', '/user/{id}-delete', 1, 2),
	(6, '角色管理', NULL, 0, 1),
	(7, '新增修改', '/role-post', 6, 2),
	(8, '列表查询', '/role-get', 6, 2),
	(9, '删除角色', '/role/{id}-delete', 6, 2),
	(11, '角色授权', '/role-authorization-post', 6, 2),
	(13, '权限管理', '', 0, 1),
	(14, '新增修改', '/permission-post', 13, 2),
	(15, '列表查询', '/permission-get', 13, 2),
	(16, '删除权限', '/permission/{id}-delete', 13, 2),
	(17, '预览权限', '/permission-view-get', 13, 2);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;

-- 导出  表 cloud-ida.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  cloud-ida.role 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`, `role_name`) VALUES
	(1, '用户管理员'),
	(3, '角色管理员'),
	(4, '权限管理员'),
	(5, '超级管理员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- 导出  表 cloud-ida.role_permission 结构
CREATE TABLE IF NOT EXISTS `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- 正在导出表  cloud-ida.role_permission 的数据：~22 rows (大约)
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES
	(43, 3, 7),
	(44, 3, 8),
	(45, 3, 9),
	(46, 3, 11),
	(47, 4, 14),
	(48, 4, 15),
	(49, 4, 16),
	(50, 4, 17),
	(51, 5, 2),
	(52, 5, 3),
	(53, 5, 4),
	(54, 5, 7),
	(55, 5, 8),
	(56, 5, 9),
	(57, 5, 11),
	(58, 5, 14),
	(59, 5, 15),
	(60, 5, 16),
	(61, 5, 17),
	(91, 1, 2),
	(92, 1, 3),
	(93, 1, 4);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;

-- 导出  表 cloud-ida.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_role_names` varchar(255) DEFAULT NULL,
  `user_account` varchar(20) DEFAULT NULL COMMENT '账号',
  `user_password` varchar(150) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 正在导出表  cloud-ida.user 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `user_name`, `user_role_names`, `user_account`, `user_password`) VALUES
	(13, '许耀辉', '用户管理员', 'user', '123456'),
	(14, '许耀辉', '超级管理员', 'admin', '123456');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 导出  表 cloud-ida.user_role 结构
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 正在导出表  cloud-ida.user_role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
	(5, 13, 1),
	(7, 14, 5);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
