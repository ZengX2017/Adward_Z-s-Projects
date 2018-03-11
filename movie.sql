/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : movie

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-03-11 13:36:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `is_super` smallint(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `role_id` (`role_id`),
  KEY `ix_admin_addtime` (`addtime`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'adwardmovie', 'pbkdf2:sha256:50000$YCZEpuht$f0ca7588c1055e6f22e19a3399cbe01fbcd63e3020d57659eb85ce942e321f71', '0', '1', '2017-12-28 06:56:29');
INSERT INTO `admin` VALUES ('3', 'abc2', 'pbkdf2:sha256:50000$9d9bgzRB$12a7a619a1625d849544204e04d1090ec099b1d51a97947d3b2dbc49fa99f5c9', '1', '2', '2017-12-30 17:47:19');

-- ----------------------------
-- Table structure for adminlog
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES ('1', '1', '127.0.0.1', '2017-12-30 14:57:57');
INSERT INTO `adminlog` VALUES ('2', '1', '127.0.0.1', '2017-12-30 14:58:05');
INSERT INTO `adminlog` VALUES ('3', '1', '127.0.0.1', '2017-12-30 14:58:11');
INSERT INTO `adminlog` VALUES ('4', '1', '127.0.0.1', '2017-12-30 14:58:17');
INSERT INTO `adminlog` VALUES ('5', '3', '127.0.0.1', '2017-12-30 18:04:43');
INSERT INTO `adminlog` VALUES ('6', '3', '127.0.0.1', '2017-12-30 18:11:01');
INSERT INTO `adminlog` VALUES ('7', '3', '127.0.0.1', '2017-12-30 18:11:13');
INSERT INTO `adminlog` VALUES ('8', '3', '127.0.0.1', '2017-12-30 18:11:39');
INSERT INTO `adminlog` VALUES ('9', '1', '127.0.0.1', '2017-12-30 18:12:03');
INSERT INTO `adminlog` VALUES ('10', '1', '127.0.0.1', '2017-12-30 21:35:32');
INSERT INTO `adminlog` VALUES ('11', '1', '127.0.0.1', '2017-12-30 22:43:58');
INSERT INTO `adminlog` VALUES ('12', '1', '127.0.0.1', '2018-01-01 19:52:36');
INSERT INTO `adminlog` VALUES ('13', '1', '127.0.0.1', '2018-01-02 08:24:22');
INSERT INTO `adminlog` VALUES ('14', '1', '127.0.0.1', '2018-01-02 08:35:46');
INSERT INTO `adminlog` VALUES ('15', '1', '127.0.0.1', '2018-01-09 12:15:59');
INSERT INTO `adminlog` VALUES ('16', '1', '127.0.0.1', '2018-01-11 20:16:02');
INSERT INTO `adminlog` VALUES ('17', '1', '127.0.0.1', '2018-01-12 13:48:51');
INSERT INTO `adminlog` VALUES ('18', '1', '127.0.0.1', '2018-01-14 21:50:04');
INSERT INTO `adminlog` VALUES ('19', '1', '127.0.0.1', '2018-01-15 08:47:34');
INSERT INTO `adminlog` VALUES ('20', '1', '127.0.0.1', '2018-01-15 08:48:05');
INSERT INTO `adminlog` VALUES ('21', '1', '127.0.0.1', '2018-01-15 08:48:43');
INSERT INTO `adminlog` VALUES ('22', '1', '127.0.0.1', '2018-01-15 09:32:27');
INSERT INTO `adminlog` VALUES ('23', '1', '127.0.0.1', '2018-01-15 20:52:08');
INSERT INTO `adminlog` VALUES ('24', '1', '127.0.0.1', '2018-03-11 13:33:36');

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `ix_auth_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('1', '添加标签', '/admin/tag/add', '2017-12-30 15:51:40');
INSERT INTO `auth` VALUES ('2', '编辑标签', '/admin/tag/edit/<int:id>', '2017-12-30 15:52:07');
INSERT INTO `auth` VALUES ('3', '标签列表', '/admin/tag/list/<int:page>/', '2017-12-30 15:53:46');
INSERT INTO `auth` VALUES ('4', '删除标签', '/admin/tag/del/<int:id>/', '2017-12-30 15:54:35');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_comment_addtime` (`addtime`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('9', '<p>我觉得OKOKOK</p>', '2', '7', '2018-01-01 19:50:33');
INSERT INTO `comment` VALUES ('10', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></p>', '2', '7', '2018-01-01 19:50:59');
INSERT INTO `comment` VALUES ('11', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0017.gif\"/></p>', '2', '7', '2018-01-02 08:23:58');
INSERT INTO `comment` VALUES ('12', '<p>柯南</p>', '10', '7', '2018-01-02 14:11:26');
INSERT INTO `comment` VALUES ('13', '<p>柯南</p>', '10', '7', '2018-01-02 14:11:26');
INSERT INTO `comment` VALUES ('14', '<p>柯南</p>', '10', '7', '2018-01-02 14:11:26');
INSERT INTO `comment` VALUES ('15', '<p>柯南</p>', '10', '7', '2018-01-02 14:11:26');
INSERT INTO `comment` VALUES ('16', '<p>柯南</p>', '10', '7', '2018-01-02 14:11:26');
INSERT INTO `comment` VALUES ('17', '<p>柯南2<br/></p>', '9', '7', '2018-01-02 14:12:08');
INSERT INTO `comment` VALUES ('18', '<p>test</p>', '12', '7', '2018-01-02 14:14:46');
INSERT INTO `comment` VALUES ('20', '<p>test</p>', '9', '7', '2018-01-15 08:47:09');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `logo` varchar(255) DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `playnum` bigint(20) DEFAULT NULL,
  `commentnum` bigint(20) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `logo` (`logo`),
  UNIQUE KEY `area` (`area`),
  KEY `tag_id` (`tag_id`),
  KEY `ix_movie_addtime` (`addtime`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('2', '阿凡达2', 'htpy.mp4', '阿凡达2', '20171231024908bc3144cad8e04a188c2023d76b3fa256.jpg', '3', '43', '3', '2', '中国', '2017-12-29', '1', '2017-12-29 17:55:34');
INSERT INTO `movie` VALUES ('9', '名侦探柯南1', '201801021357317e00e3d4646f4a6c8b502bd2222a95b5.mp4', '名侦探柯南片段1', '201801021357314e88c6c585584849a9a95b699d0471bf.jpg', '1', '14', '2', '1', '中国大陆', '2018-01-06', '5', '2018-01-02 13:57:31');
INSERT INTO `movie` VALUES ('10', '名侦探柯南2', '201801021359220b8d1a2d48dc4fb3ad4a25af1b328b9f.mp4', '名侦探柯南2', '201801021359228b16f87b0f1f42e8a9383d8e2b403d3a.jpg', '2', '16', '5', '2', '中国台湾', '2018-01-20', '5', '2018-01-02 13:59:22');
INSERT INTO `movie` VALUES ('11', '名侦探柯南3', '201801021400340c6c0a95c06d447490adeb8532345e0e.mp4', '名侦探柯南3', '201801021400340a6fe1d39cae48b5b8a8f8b64658471b.jpg', '3', '1', '0', '3', '中国香港', '2018-01-27', '4', '2018-01-02 14:00:35');
INSERT INTO `movie` VALUES ('12', '名侦探柯南4', '2018010214131343492733e7b94ad1b07afcfa82b34a12.mp4', '名侦探柯南4', '20180102140609c17a562588744576b00fe40a09c13ab9.jpg', '4', '13', '2', '1', '日本', '2018-01-06', '3', '2018-01-02 14:02:00');
INSERT INTO `movie` VALUES ('13', '名侦探柯南5', '201801021405251a126597d1fd49f9a1e1c5a17e802191.mp4', '名侦探柯南5', '201801021405255c280e1ad0aa405a9d6c26dbeac61fbe.jpg', '5', '2', '0', '4', '新加坡', '2018-01-23', '3', '2018-01-02 14:05:25');

-- ----------------------------
-- Table structure for moviecol
-- ----------------------------
DROP TABLE IF EXISTS `moviecol`;
CREATE TABLE `moviecol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_moviecol_addtime` (`addtime`),
  CONSTRAINT `moviecol_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `moviecol_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of moviecol
-- ----------------------------
INSERT INTO `moviecol` VALUES ('5', null, '7', '2017-12-30 22:48:16');
INSERT INTO `moviecol` VALUES ('6', '2', '7', '2017-12-31 14:51:15');
INSERT INTO `moviecol` VALUES ('7', '12', '7', '2018-01-15 09:31:50');

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_oplog_addtime` (`addtime`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oplog
-- ----------------------------
INSERT INTO `oplog` VALUES ('2', '1', '127.0.0.1', '添加标签：abc', '2017-12-30 14:43:08');
INSERT INTO `oplog` VALUES ('3', '1', '127.0.0.1', '添加权限：添加标签', '2017-12-30 15:51:40');
INSERT INTO `oplog` VALUES ('4', '1', '127.0.0.1', '添加权限：编辑标签', '2017-12-30 15:52:07');
INSERT INTO `oplog` VALUES ('5', '1', '127.0.0.1', '添加权限：标签列表', '2017-12-30 15:53:46');
INSERT INTO `oplog` VALUES ('6', '1', '127.0.0.1', '添加权限：删除标签', '2017-12-30 15:54:35');
INSERT INTO `oplog` VALUES ('7', '1', '127.0.0.1', '添加权限：abc', '2017-12-30 16:04:01');
INSERT INTO `oplog` VALUES ('8', '1', '127.0.0.1', '添加管理员：abc123', '2017-12-30 17:46:11');
INSERT INTO `oplog` VALUES ('9', '1', '127.0.0.1', '添加管理员：abc2', '2017-12-30 17:47:19');
INSERT INTO `oplog` VALUES ('10', '1', '127.0.0.1', '添加标签：test', '2018-01-02 08:24:33');
INSERT INTO `oplog` VALUES ('11', '1', '127.0.0.1', '添加标签：ff', '2018-01-15 09:33:58');

-- ----------------------------
-- Table structure for preview
-- ----------------------------
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `logo` (`logo`),
  KEY `ix_preview_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preview
-- ----------------------------
INSERT INTO `preview` VALUES ('1', '名侦探柯南1', '2018010214090689b63e71fae34fda927391f2c7c3f856.jpg', '2017-12-30 11:25:43');
INSERT INTO `preview` VALUES ('2', '名侦探柯南2', '201801021408462e417463d75b47158ad65641595f7416.jpg', '2017-12-30 11:39:17');
INSERT INTO `preview` VALUES ('5', 'Conan', '201712310248398b28ef62313e4a9fad33bdae471d7618.jpg', '2017-12-31 02:48:40');
INSERT INTO `preview` VALUES ('6', 'Conan2', '201712310248595876718910b94fab9900e03988c14636.jpg', '2017-12-31 02:49:00');
INSERT INTO `preview` VALUES ('7', 'Conan3', '20171231024908bc3144cad8e04a188c2023d76b3fa256.jpg', '2017-12-31 02:49:09');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `auths` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_role_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '', '2017-12-28 06:53:18');
INSERT INTO `role` VALUES ('2', '标签管理员', '1,3', '2017-12-30 16:51:29');
INSERT INTO `role` VALUES ('4', '标签管理员2', '1,2,4', '2017-12-30 17:00:46');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_tag_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '科幻', '2017-12-29 12:25:49');
INSERT INTO `tag` VALUES ('2', '动作', '2017-12-29 12:40:47');
INSERT INTO `tag` VALUES ('3', '爱情', '2017-12-29 12:41:12');
INSERT INTO `tag` VALUES ('4', '魔幻', '2017-12-29 13:26:47');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `info` text,
  `face` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `face` (`face`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('7', 'AdwardZ', 'pbkdf2:sha256:50000$vLcjqCTg$8ba40497587f3d3a05619918d6e835392458b3e1082ddb314c5b946eecdb014e', 'adward@adwardz.top', '13262216070', null, '003.jpg', '2017-12-30 21:35:07', 'c0f0925b06e8409ead8a90f06fe68671');

-- ----------------------------
-- Table structure for userlog
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES ('7', '7', '127.0.0.1', '2017-12-30 22:41:59');
INSERT INTO `userlog` VALUES ('8', '7', '127.0.0.1', '2017-12-30 23:14:15');
INSERT INTO `userlog` VALUES ('9', '7', '127.0.0.1', '2017-12-30 23:41:24');
INSERT INTO `userlog` VALUES ('10', '7', '127.0.0.1', '2017-12-30 23:43:37');
INSERT INTO `userlog` VALUES ('11', '7', '127.0.0.1', '2017-12-30 23:56:00');
INSERT INTO `userlog` VALUES ('12', '7', '127.0.0.1', '2017-12-30 23:56:10');
INSERT INTO `userlog` VALUES ('13', null, '127.0.0.1', '2017-12-31 00:05:46');
INSERT INTO `userlog` VALUES ('14', '7', '127.0.0.1', '2017-12-31 00:05:54');
INSERT INTO `userlog` VALUES ('15', '7', '127.0.0.1', '2017-12-31 00:11:17');
INSERT INTO `userlog` VALUES ('16', '7', '127.0.0.1', '2017-12-31 00:15:35');
INSERT INTO `userlog` VALUES ('17', '7', '127.0.0.1', '2017-12-31 00:25:09');
INSERT INTO `userlog` VALUES ('18', '7', '127.0.0.1', '2017-12-31 00:25:11');
INSERT INTO `userlog` VALUES ('19', '7', '127.0.0.1', '2017-12-31 00:25:13');
INSERT INTO `userlog` VALUES ('20', '7', '127.0.0.1', '2017-12-31 02:53:25');
INSERT INTO `userlog` VALUES ('21', '7', '127.0.0.1', '2017-12-31 12:31:56');
INSERT INTO `userlog` VALUES ('22', '7', '127.0.0.1', '2017-12-31 12:34:06');
INSERT INTO `userlog` VALUES ('23', '7', '127.0.0.1', '2017-12-31 12:39:17');
INSERT INTO `userlog` VALUES ('24', '7', '127.0.0.1', '2018-01-01 16:12:03');
INSERT INTO `userlog` VALUES ('25', '7', '127.0.0.1', '2018-01-01 17:00:14');
INSERT INTO `userlog` VALUES ('26', '7', '127.0.0.1', '2018-01-01 17:01:15');
INSERT INTO `userlog` VALUES ('27', '7', '127.0.0.1', '2018-01-01 17:06:28');
INSERT INTO `userlog` VALUES ('28', '7', '127.0.0.1', '2018-01-01 19:49:57');
INSERT INTO `userlog` VALUES ('29', '7', '127.0.0.1', '2018-01-01 20:16:15');
INSERT INTO `userlog` VALUES ('30', '7', '127.0.0.1', '2018-01-02 08:23:19');
INSERT INTO `userlog` VALUES ('31', '7', '127.0.0.1', '2018-01-02 08:29:19');
INSERT INTO `userlog` VALUES ('32', '7', '127.0.0.1', '2018-01-02 08:35:35');
INSERT INTO `userlog` VALUES ('33', '7', '127.0.0.1', '2018-01-02 14:18:10');
INSERT INTO `userlog` VALUES ('34', '7', '127.0.0.1', '2018-01-03 14:25:15');
INSERT INTO `userlog` VALUES ('35', '7', '127.0.0.1', '2018-01-11 20:12:27');
INSERT INTO `userlog` VALUES ('36', '7', '127.0.0.1', '2018-01-12 13:47:00');
INSERT INTO `userlog` VALUES ('37', '7', '127.0.0.1', '2018-01-15 08:31:39');
INSERT INTO `userlog` VALUES ('38', '7', '127.0.0.1', '2018-01-15 08:43:23');
INSERT INTO `userlog` VALUES ('39', '7', '127.0.0.1', '2018-01-15 08:45:25');
INSERT INTO `userlog` VALUES ('40', '7', '127.0.0.1', '2018-01-15 08:51:48');
INSERT INTO `userlog` VALUES ('41', '7', '127.0.0.1', '2018-01-15 09:30:50');
INSERT INTO `userlog` VALUES ('42', '7', '127.0.0.1', '2018-01-15 21:18:57');
INSERT INTO `userlog` VALUES ('43', '7', '127.0.0.1', '2018-01-27 21:42:10');
