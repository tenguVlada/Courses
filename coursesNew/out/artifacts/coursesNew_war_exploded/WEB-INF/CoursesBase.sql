/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.7.24-log : Database - courses
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`courses` /*!40100 DEFAULT CHARACTER SET cp1251 */;

USE `courses`;

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` int(11) DEFAULT NULL,
  `a_text` varchar(500) DEFAULT NULL,
  `coefficient` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IndexQuestion` (`question`),
  CONSTRAINT `FK_answer` FOREIGN KEY (`question`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/*Data for the table `answer` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `evaluation` int(10) unsigned zerofill DEFAULT NULL,
  `comment` varchar(400) DEFAULT NULL,
  `post_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StudentIndex` (`student`),
  KEY `CourseIndex` (`course`),
  CONSTRAINT `FK_comment` FOREIGN KEY (`student`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_comment_course` FOREIGN KEY (`course`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/*Data for the table `comment` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lecturer` int(11) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LecturerIndex` (`lecturer`),
  CONSTRAINT `FK_course` FOREIGN KEY (`lecturer`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/*Data for the table `course` */

/*Table structure for table `exam` */

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` int(11) DEFAULT NULL,
  `evaluation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CourseIndex` (`course`),
  CONSTRAINT `FK_exam` FOREIGN KEY (`course`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/*Data for the table `exam` */

/*Table structure for table `lesson` */

DROP TABLE IF EXISTS `lesson`;

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` int(11) DEFAULT NULL,
  `less_name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `material` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CourseIndex` (`course`),
  CONSTRAINT `FK_lesson` FOREIGN KEY (`course`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/*Data for the table `lesson` */

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test` int(11) DEFAULT NULL,
  `q_text` varchar(400) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `isExam` tinyint(1) DEFAULT NULL,
  `isOpen` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TestIndex` (`test`),
  CONSTRAINT `FK_question` FOREIGN KEY (`test`) REFERENCES `test` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/*Data for the table `question` */

/*Table structure for table `studentanswer` */

DROP TABLE IF EXISTS `studentanswer`;

CREATE TABLE `studentanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student` int(11) DEFAULT NULL,
  `answer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StudentIndex` (`student`),
  KEY `AnswerIndex` (`answer`),
  CONSTRAINT `FK_studentanswer` FOREIGN KEY (`student`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_studentanswer_a` FOREIGN KEY (`answer`) REFERENCES `answer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/*Data for the table `studentanswer` */

/*Table structure for table `studentlesson` */

DROP TABLE IF EXISTS `studentlesson`;

CREATE TABLE `studentlesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student` int(11) DEFAULT NULL,
  `lesson` int(11) DEFAULT NULL,
  `page` int(10) unsigned zerofill DEFAULT NULL,
  `mark` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StudentIndex` (`student`),
  KEY `LessonIndex` (`lesson`),
  CONSTRAINT `FK_studentlesson_l` FOREIGN KEY (`lesson`) REFERENCES `lesson` (`id`),
  CONSTRAINT `FK_studentlesson_s` FOREIGN KEY (`student`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/*Data for the table `studentlesson` */

/*Table structure for table `subscribe` */

DROP TABLE IF EXISTS `subscribe`;

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `mark` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StudentIndex` (`student`),
  KEY `CourseIndex` (`course`),
  CONSTRAINT `FK_subscribe_course` FOREIGN KEY (`course`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_subscribe_student` FOREIGN KEY (`student`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/*Data for the table `subscribe` */

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson` int(11) DEFAULT NULL,
  `evaluation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LessonIndex` (`lesson`),
  CONSTRAINT `FK_test` FOREIGN KEY (`lesson`) REFERENCES `lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/*Data for the table `test` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT NULL,
  `hash_pass` varchar(20) DEFAULT NULL,
  `role` varchar(8) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `photo` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;

/*Data for the table `user` */

insert  into `user`(`id`,`login`,`hash_pass`,`role`,`user_name`,`description`,`photo`) values (1,'admin','admin','admin',NULL,NULL,NULL),(2,'student','student','student',NULL,NULL,NULL),(3,'lecturer','lecturer','lecturer',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
