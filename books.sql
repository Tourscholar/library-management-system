/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50735
Source Host           : localhost:3306
Source Database       : books

Target Server Type    : MYSQL
Target Server Version : 50735
File Encoding         : 65001

Date: 2022-11-12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `email` char(255) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `times` int(11) DEFAULT '0', -- 借阅次数
  `status` int(11) DEFAULT '1', -- 角色 读者为1 管理员为2
  `lend_num` int(11) DEFAULT NULL, -- 可借阅天数
  `max_num` int(11) DEFAULT NULL, -- 最大可借数量
  PRIMARY KEY (`aid`,`username`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('10000', 'admin', '슈퍼관리자', '123456', '972014123@naver.com', '01007000000', '0', '2', null, null);
INSERT INTO `admin` VALUES ('10001', '1816270150', '사용자1호', 'wyz123456', '642492123@naver.com', '01007000001', '4', '1', '30', '5');
INSERT INTO `admin` VALUES ('10002', '1507550140', '사용자2호', 'wq570121', '1667942357@naver.com', '01007000002', '2', '1', '30', '10');
INSERT INTO `admin` VALUES ('10003', '1816270151', '사용자3호', 'yy123456', '1068457627@naver.com', '01007000003', '2', '1', '30', '5');
INSERT INTO `admin` VALUES ('10004', '1816270152', '사용자4호', 'gjx123456', '6485113975@naver.com', '01007000004', '1', '1', '30', '5');
INSERT INTO `admin` VALUES ('10005', '101', '관리자', '101.123456', '1068457627@naver.com', '01007000005', '0', '2', null, null);
INSERT INTO `admin` VALUES ('10006', '1816270153', '사용자5호', 'zll123456', '1068457628@naver.com', '01007000006', '0', '1', '30', '5');
INSERT INTO `admin` VALUES ('10007', '1816270154', '사용자6호', 'xy123456', '1068457629@naver.com', '01007000007', '0', '1', '30', '5');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(205) NOT NULL,
  `card` char(205) NOT NULL,
  `autho` char(205) DEFAULT NULL,
  `num` int(11) NOT NULL, -- 图书数量
  `press` char(205) DEFAULT NULL, -- 出版社
  `type` char(255) DEFAULT NULL, -- 图书类型
  `times` int(11) DEFAULT '0', -- 被借阅次数
  PRIMARY KEY (`bid`) USING BTREE,
  KEY `card` (`card`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2000007 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('2000001', 'C언어', '3001001', '안용대', '5', '시공사', '001교재', '1');
INSERT INTO `book` VALUES ('2000002', '작은 땅의 야수들', '3003001', '엘리자베스', '20', '위즈덤하우스', '003소설', '2');
INSERT INTO `book` VALUES ('2000003', '빅데이터', '3002001', '조성준', '15', '북이십일', '002참고자료', '2');
INSERT INTO `book` VALUES ('2000004', '락다운', '3004001', '피터', '10', '위즈덤하우스', '004외국소설', '2');
INSERT INTO `book` VALUES ('2000005', '인사이트', '3004002', '요네자와', '10', '다산북스', '004외국소설', '1');
INSERT INTO `book` VALUES ('2000006', 'Java언어', '3001002', '임성연 ', '7', '시공사', '001교재', '1');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `tid` int(11) NOT NULL AUTO_INCREMENT, -- 图书分类id
  `name` char(50) NOT NULL, -- 分类名称
  PRIMARY KEY (`tid`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3005 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('3001', '001교재');
INSERT INTO `booktype` VALUES ('3002', '002참고자료');
INSERT INTO `booktype` VALUES ('3003', '003소설');
INSERT INTO `booktype` VALUES ('3004', '004외국소설');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `hid` int(11) NOT NULL AUTO_INCREMENT, -- 借阅记录id
  `aid` int(11) DEFAULT NULL, -- 借书人id
  `bid` int(11) DEFAULT NULL, -- 图书id
  `card` int(11) DEFAULT NULL, -- 图书号
  `bookname` char(255) DEFAULT NULL,
  `adminname` char(255) DEFAULT NULL, -- 借书人账号
  `username` char(255) DEFAULT NULL, -- 借书人名称
  `begintime` char(255) DEFAULT NULL, -- 开始时间
  `endtime` char(255) DEFAULT NULL, -- 结束时间
  `status` int(11) DEFAULT NULL, -- 借书状态 1: 正在借阅 0: 已归还
  PRIMARY KEY (`hid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `aid` (`aid`) USING BTREE,
  KEY `bid` (`bid`) USING BTREE,
  KEY `bookname` (`bookname`) USING BTREE,
  KEY `adminname` (`adminname`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=400010 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('400001', '10001', '2000001', '3001001', 'C언어', '1816270150', '사용자1호', '2022-10-25', '202-10-27', '0');
INSERT INTO `history` VALUES ('400002', '10002', '2000002', '3003001', '작은 땅의 야수들', '1507550139', '사용자2호', '2022-10-26', '2022-10-28', '0');
INSERT INTO `history` VALUES ('400003', '10003', '2000003', '3002001', '빅데이터', '1816270151', '사용자3호', '2022-10-27', '2022-11-4', '0');
INSERT INTO `history` VALUES ('400004', '10001', '2000002', '3003001', '작은 땅의 야수들', '1816270150', '사용자1호', '2022-10-27', '2022-11-27', '1');
INSERT INTO `history` VALUES ('400005', '10001', '2000003', '3002001', '빅데이터', '1816270150', '사용자1호', '2022-10-27', '2022-11-27', '1');
INSERT INTO `history` VALUES ('400006', '10002', '2000004', '3004001', '피터', '1507550139', '사용자2호', '2022-10-28', '2022-11-28', '1');
INSERT INTO `history` VALUES ('400007', '10004', '2000004', '3004001', '피터', '1816270152', '사용자4호', '2022-10-29', '2022-11-29', '1');
INSERT INTO `history` VALUES ('400008', '10003', '2000005', '3004002', '인사이트', '1816270151', '사용자3호', '2022-10-29', '2022-11-29', '1');
INSERT INTO `history` VALUES ('400009', '10001', '2000006', '3001002', 'Java언어', '1816270150', '사용자6호', '2022-10-29', '2022-11-4', '0');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `pid` int(11) NOT NULL AUTO_INCREMENT, -- 问题id
  `aid` int(11) DEFAULT NULL, -- 反馈者id
  `name` char(50) DEFAULT NULL, -- 问题标题
  `page` char(50) DEFAULT NULL, -- 问题的页面
  `body` char(255) DEFAULT NULL, -- 问题的描述
  `phone` char(20) DEFAULT NULL, -- 联系方式
  `status` char(5) NOT NULL DEFAULT '미해결', -- 问题状态
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5000003 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES ('5000001', '10001', '인증번호 문제', 'login', '로그인 페이지의 인증번호가 잘 보이지 않습니다', '123123', '미해결');
INSERT INTO `problem` VALUES ('5000002', '10002', '차트', 'brtimes，bdtimes', '차트를 보여줘야 됩디다', '12312345', '해결');
