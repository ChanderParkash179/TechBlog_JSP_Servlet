/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.14-MariaDB : Database - techblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`techblog` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `techblog`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `cid` int(12) NOT NULL AUTO_INCREMENT,
  `cname` varchar(120) NOT NULL,
  `cdescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `categories` */

insert  into `categories`(`cid`,`cname`,`cdescription`) values 
(1,'Java','Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. It is a general-purpose programming language intended t'),
(2,'Python','Python is an interpreted high-level general-purpose programming language. Its design philosophy emphasizes code readability with its use of significant indentation. Its language constructs as well as '),
(3,'R','R is a programming language and free software environment for statistical computing and graphics supported by the R Core Team and the R Foundation for Statistical Computing.'),
(4,'JavaScript','JavaScript is high-level, often just-in-time compiled and multi-paradigm. It has dynamic typing, prototype-based object-orientation and first-class functions.'),
(5,'Kotlin','Kotlin is a cross-platform, statically typed, general-purpose programming language with type inference. Kotlin is designed to interoperate fully with Java, and the JVM version of Kotlin\'s standard lib'),
(6,'C','C is a general-purpose, procedural computer programming language supporting structured programming, lexical variable scope, and recursion, with a static type system.'),
(7,'C++','C++  is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language'),
(8,'C#','C# is a general-purpose, multi-paradigm programming language. C# encompasses static typing, strong typing, lexically scoped, imperative, declarative, functional, generic, object-oriented (class-based)'),
(9,'Assembly','Assembly Language is any low-level programming language in which there is a very strong correspondence between the instructions in the language and the architecture\'s machine code instructions.'),
(10,'COBOL','COBOL is a compiled English-like computer programming language designed for business use. It is an imperative, procedural and, since 2002, object-oriented language.');

/*Table structure for table `liked` */

DROP TABLE IF EXISTS `liked`;

CREATE TABLE `liked` (
  `lid` int(20) NOT NULL AUTO_INCREMENT,
  `pid` int(20) DEFAULT NULL,
  `uid` int(20) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`),
  CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`pId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `liked_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `liked` */

insert  into `liked`(`lid`,`pid`,`uid`) values 
(17,6,4);

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `pId` int(12) NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext DEFAULT NULL,
  `pCode` longtext DEFAULT NULL,
  `pPic` varchar(100) DEFAULT NULL,
  `pDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `catId` int(12) NOT NULL,
  `userId` int(12) NOT NULL,
  PRIMARY KEY (`pId`),
  KEY `catId` (`catId`),
  KEY `userId` (`userId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `posts` */

insert  into `posts`(`pId`,`pTitle`,`pContent`,`pCode`,`pPic`,`pDate`,`catId`,`userId`) values 
(6,'Java 8 Feature','lambda Expression is the new Java 8 update feature','','javalambda.jpg','2021-11-23 23:14:03',1,6),
(7,'Java Parallel Sorting','parallel sorting is the updated feature of java 8','','parallel java.png','2021-11-23 23:16:44',1,6),
(8,'Date Time API in Java 8 ','date and time api is introduced in java 8','','datetime.png','2021-11-23 23:21:33',1,6),
(9,'Python Web Framework','Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries. It has no database abstraction layer, form validation, or any other components where pre-existing third-party libraries provide common functions.','','flask.png','2021-11-24 00:58:51',2,6),
(10,'R Language New Update','Changes in R. New features and bug fixes of the latest release version of R are documented in the file NEWS','','r.png','2021-11-24 22:13:51',3,4),
(11,'Numeric Separators','Numeric separators are a JavaScript feature that allows you to use underscore as a separator in numeric literals, for example, you can write 10000 as 10_000 . The feature works in recent versions of modern browsers as well as Node. js.','','js.jpg','2021-11-25 00:38:15',4,5);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(500) DEFAULT 'default.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`password`,`gender`,`reg_date`,`profile`) values 
(4,'Admin','admin@gmail.com','admin','Male','2021-11-14 01:15:57','default.png'),
(5,'Rehan','rehan@gmail.com','rehan','Male','2021-11-14 01:29:22','default.png'),
(6,'Chander','chander@gmail.com','chander','Male','2021-11-14 16:01:09','IMG_3885.JPG');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
