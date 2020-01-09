/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : onlinetestsys

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2020-01-09 20:08:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `idcard` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `QQ` varchar(20) DEFAULT NULL,
  `emai` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `chapter`
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_id` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_subjectChaper` (`sub_id`),
  CONSTRAINT `FK_subjectChaper` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chapter
-- ----------------------------

-- ----------------------------
-- Table structure for `classes`
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `classesId` int(11) NOT NULL AUTO_INCREMENT,
  `classesName` varchar(20) NOT NULL,
  `grade` varchar(20) NOT NULL,
  PRIMARY KEY (`classesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------

-- ----------------------------
-- Table structure for `examhis`
-- ----------------------------
DROP TABLE IF EXISTS `examhis`;
CREATE TABLE `examhis` (
  `studentId` varchar(20) NOT NULL,
  `studentName` varchar(20) DEFAULT NULL,
  `subjectId` int(11) NOT NULL,
  `subjectName` varchar(20) DEFAULT NULL,
  `classesId` int(11) DEFAULT NULL,
  `classesName` varchar(20) DEFAULT NULL,
  `examTime` datetime NOT NULL,
  `score` int(11) DEFAULT NULL,
  `examTest` text,
  `status` int(11) NOT NULL DEFAULT '0',
  `publishExamId` int(11) NOT NULL,
  PRIMARY KEY (`studentId`,`subjectId`,`examTime`),
  CONSTRAINT `FK_stu_his` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examhis
-- ----------------------------

-- ----------------------------
-- Table structure for `experimentinfo`
-- ----------------------------
DROP TABLE IF EXISTS `experimentinfo`;
CREATE TABLE `experimentinfo` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `StuId` varchar(10) NOT NULL,
  `SubjectId` varchar(10) NOT NULL,
  `WhetherSubmit` enum('否','是') NOT NULL DEFAULT '是',
  `SubmitTime` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of experimentinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `functions`
-- ----------------------------
DROP TABLE IF EXISTS `functions`;
CREATE TABLE `functions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `uri` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of functions
-- ----------------------------

-- ----------------------------
-- Table structure for `publishexam`
-- ----------------------------
DROP TABLE IF EXISTS `publishexam`;
CREATE TABLE `publishexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(20) NOT NULL,
  `publishTime` datetime NOT NULL,
  `subject_id` int(11) NOT NULL,
  `examTime` datetime NOT NULL,
  `description` text,
  `exam` text,
  `examType` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `admin_name` varchar(20) NOT NULL,
  `subject_name` varchar(20) NOT NULL,
  `examlength` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publishexam
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for `role_function`
-- ----------------------------
DROP TABLE IF EXISTS `role_function`;
CREATE TABLE `role_function` (
  `r_id` int(11) NOT NULL DEFAULT '0',
  `f_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`r_id`,`f_id`),
  KEY `f_id_fk` (`f_id`),
  CONSTRAINT `f_id_fk` FOREIGN KEY (`f_id`) REFERENCES `functions` (`id`),
  CONSTRAINT `r_id_fk2` FOREIGN KEY (`r_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_function
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(20) NOT NULL,
  `classesId` int(11) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `idcard` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `QQ` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `classesName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_studentClasses` (`classesId`),
  CONSTRAINT `FK_studentClasses` FOREIGN KEY (`classesId`) REFERENCES `classes` (`classesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `stuinfo`
-- ----------------------------
DROP TABLE IF EXISTS `stuinfo`;
CREATE TABLE `stuinfo` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `StuId` varchar(10) NOT NULL,
  `StuName` varchar(20) NOT NULL,
  `StuSex` enum('女','男') NOT NULL DEFAULT '男',
  `StuTelephone` varchar(20) DEFAULT NULL,
  `StuClass` varchar(30) NOT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `StuFlag` enum('未注册','已注册') NOT NULL DEFAULT '已注册',
  `actived` bit(1) DEFAULT NULL,
  `activeCode` varchar(100) DEFAULT NULL,
  `activeDate` date DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`,`StuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stuinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------

-- ----------------------------
-- Table structure for `subjectclasses`
-- ----------------------------
DROP TABLE IF EXISTS `subjectclasses`;
CREATE TABLE `subjectclasses` (
  `classesId` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`classesId`,`id`),
  KEY `FK_subjectClasses2` (`id`),
  CONSTRAINT `FK_subjectClasses` FOREIGN KEY (`classesId`) REFERENCES `classes` (`classesId`),
  CONSTRAINT `FK_subjectClasses2` FOREIGN KEY (`id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subjectclasses
-- ----------------------------

-- ----------------------------
-- Table structure for `subjectinfo`
-- ----------------------------
DROP TABLE IF EXISTS `subjectinfo`;
CREATE TABLE `subjectinfo` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `SubjectId` varchar(10) NOT NULL,
  `SubjectName` varchar(50) NOT NULL,
  `SubjectTeacher` varchar(20) NOT NULL,
  `UseCourse` varchar(50) NOT NULL,
  `UseClass` varchar(30) NOT NULL,
  `SubjectSubmit` enum('实验报告','课堂检杳') NOT NULL DEFAULT '课堂检杳',
  `CreateTime` date NOT NULL,
  PRIMARY KEY (`Id`,`SubjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subjectinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `idcard` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `QQ` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher_classes`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_classes`;
CREATE TABLE `teacher_classes` (
  `id` varchar(20) NOT NULL,
  `classesId` int(11) NOT NULL,
  `subId` int(11) NOT NULL,
  PRIMARY KEY (`id`,`classesId`,`subId`),
  KEY `FK_teacher_classes2` (`classesId`),
  KEY `FK_teacher_classes3` (`subId`),
  CONSTRAINT `FK_teacher_classes` FOREIGN KEY (`id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FK_teacher_classes2` FOREIGN KEY (`classesId`) REFERENCES `classes` (`classesId`),
  CONSTRAINT `FK_teacher_classes3` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_classes
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher_subject`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_subject`;
CREATE TABLE `teacher_subject` (
  `id` varchar(20) NOT NULL,
  `sub_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sub_id`),
  KEY `FK_teacher_subject2` (`sub_id`),
  CONSTRAINT `FK_teacher_subject` FOREIGN KEY (`id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FK_teacher_subject2` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_subject
-- ----------------------------

-- ----------------------------
-- Table structure for `text`
-- ----------------------------
DROP TABLE IF EXISTS `text`;
CREATE TABLE `text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tex_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `answer` varchar(200) NOT NULL,
  `diffculty` int(11) NOT NULL,
  `modelName` varchar(200) DEFAULT NULL,
  `subjectName` varchar(200) DEFAULT NULL,
  `subjectId` int(11) NOT NULL,
  `chapterId` int(11) DEFAULT NULL,
  `chapterName` varchar(200) NOT NULL,
  `type1` varchar(200) DEFAULT NULL,
  `type2` varchar(200) DEFAULT NULL,
  `type3` varchar(200) DEFAULT NULL,
  `type4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_text_type` (`Tex_id`),
  CONSTRAINT `FK_text_type` FOREIGN KEY (`Tex_id`) REFERENCES `textmodel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of text
-- ----------------------------

-- ----------------------------
-- Table structure for `textmodel`
-- ----------------------------
DROP TABLE IF EXISTS `textmodel`;
CREATE TABLE `textmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `textType` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of textmodel
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `actived` bit(1) DEFAULT NULL,
  `activeCode` varchar(100) DEFAULT NULL,
  `activeDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('3', 'zhang', '123', 'zhang Teachar', null, null, null);
INSERT INTO users VALUES ('4', 'hong', '123', 'Dr.hong', null, null, null);

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `u_id` int(11) NOT NULL DEFAULT '0',
  `r_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`,`r_id`),
  KEY `r_id_fk1` (`r_id`),
  CONSTRAINT `r_id_fk1` FOREIGN KEY (`r_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `u_id_fk` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
