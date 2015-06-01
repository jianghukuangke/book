/*
MySQL Data Transfer
Source Host: localhost
Source Database: book
Target Host: localhost
Target Database: book
Date: 2015-4-21 13:18:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookid` varchar(20) NOT NULL,
  `bookname` varchar(255) default NULL,
  `author` varchar(255) default NULL,
  `press` varchar(255) default NULL,
  `price` float(5,2) default NULL,
  `memo` varchar(200) default NULL,
  PRIMARY KEY  (`bookid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'web编程', '张三', '清华大学出版社', '32.90', '111');
