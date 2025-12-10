/*
SQLyog Community v12.4.0 (64 bit)
MySQL - 5.6.12-log : Database - main_project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`main_project` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `main_project`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

insert  into `auth_group`(`id`,`name`) values 
(1,'Hub');

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

insert  into `auth_group_permissions`(`id`,`group_id`,`permission_id`) values 
(1,1,1),
(2,1,20);

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can add permission',2,'add_permission'),
(5,'Can change permission',2,'change_permission'),
(6,'Can delete permission',2,'delete_permission'),
(7,'Can add group',3,'add_group'),
(8,'Can change group',3,'change_group'),
(9,'Can delete group',3,'delete_group'),
(10,'Can add user',4,'add_user'),
(11,'Can change user',4,'change_user'),
(12,'Can delete user',4,'delete_user'),
(13,'Can add content type',5,'add_contenttype'),
(14,'Can change content type',5,'change_contenttype'),
(15,'Can delete content type',5,'delete_contenttype'),
(16,'Can add session',6,'add_session'),
(17,'Can change session',6,'change_session'),
(18,'Can delete session',6,'delete_session'),
(19,'Can add booking',7,'add_booking'),
(20,'Can change booking',7,'change_booking'),
(21,'Can delete booking',7,'delete_booking'),
(22,'Can add buyer',8,'add_buyer'),
(23,'Can change buyer',8,'change_buyer'),
(24,'Can delete buyer',8,'delete_buyer'),
(25,'Can add cart',9,'add_cart'),
(26,'Can change cart',9,'change_cart'),
(27,'Can delete cart',9,'delete_cart'),
(28,'Can add category',10,'add_category'),
(29,'Can change category',10,'change_category'),
(30,'Can delete category',10,'delete_category'),
(31,'Can add feedback',11,'add_feedback'),
(32,'Can change feedback',11,'change_feedback'),
(33,'Can delete feedback',11,'delete_feedback'),
(34,'Can add products',12,'add_products'),
(35,'Can change products',12,'change_products'),
(36,'Can delete products',12,'delete_products'),
(37,'Can add staff',13,'add_staff'),
(38,'Can change staff',13,'change_staff'),
(39,'Can delete staff',13,'delete_staff'),
(40,'Can add sub_category',14,'add_sub_category'),
(41,'Can change sub_category',14,'change_sub_category'),
(42,'Can delete sub_category',14,'delete_sub_category'),
(43,'Can add wishlist',15,'add_wishlist'),
(44,'Can change wishlist',15,'change_wishlist'),
(45,'Can delete wishlist',15,'delete_wishlist'),
(46,'Can add checkout',16,'add_checkout'),
(47,'Can change checkout',16,'change_checkout'),
(48,'Can delete checkout',16,'delete_checkout'),
(49,'Can add returnproduct',17,'add_returnproduct'),
(50,'Can change returnproduct',17,'change_returnproduct'),
(51,'Can delete returnproduct',17,'delete_returnproduct');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$100000$qieeRizy6XiA$JVN3arjV9y2JaDerwtofynqXBmzJRVgzxFWvg7EBaow=','2025-12-08 14:31:44.603556',1,'admin','','','',1,1,'2025-12-08 14:30:43.469352'),
(2,'pbkdf2_sha256$100000$ASa3bWIcKSyI$hz0pwCdAlUBVRWFYWBF6v2ylkd8dOAaAFFu1cwdN+5o=','2025-12-09 09:51:46.284311',0,'staff1@gmail.com','','','',0,1,'2025-12-08 14:34:21.193917'),
(3,'pbkdf2_sha256$100000$h033NFElWBmq$2D0lMkFaEHvX5f5ZVgGm6J14Dyl0FpYn+T+HSksT+cA=',NULL,0,'staff2@gmail.com','','','',0,1,'2025-12-08 14:35:26.808240'),
(4,'pbkdf2_sha256$100000$HzIN0uhaS3vv$5krUdEr2ydiScjHns2oRzdiMQzLi2tDsLc5WK7F1LX8=','2025-12-09 10:48:25.487938',0,'staff3@gmail.com','','','',0,1,'2025-12-08 14:36:19.217778'),
(5,'pbkdf2_sha256$100000$g6Z0MJcclZOF$jCS/ybO7N1W1NJ95Gzxe4ujtgFUy7YquITBirujjaC4=','2025-12-09 14:31:53.188675',0,'vijo@gmail.com','vijo','','vijo9905@gmail.com',0,1,'2025-12-08 15:11:00.799789'),
(6,'pbkdf2_sha256$100000$3xXas2MgJPBT$QE4CDD3QkhoGpGQTxunkrEATMXR+8BXciQ8/6xN8j1M=','2025-12-09 13:44:10.675833',0,'staff4@gmail.com','','','',0,1,'2025-12-09 10:35:45.193620'),
(7,'pbkdf2_sha256$100000$kw2f05ABTwcX$yA1AFjU443e7286+8UnYBR6WcO7YPaMKIuVUDKyejbA=','2025-12-09 14:31:22.006852',0,'group@gmail.com','group','group','group@gmail.com',1,1,'2025-12-09 14:27:03.000000');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

insert  into `auth_user_groups`(`id`,`user_id`,`group_id`) values 
(1,7,1);

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2025-12-08 14:34:21.269239','2','staff1@gmail.com',1,'[{\"added\": {}}]',4,1),
(2,'2025-12-08 14:34:57.123328','1','staff1',1,'[{\"added\": {}}]',13,1),
(3,'2025-12-08 14:35:26.881203','3','staff2@gmail.com',1,'[{\"added\": {}}]',4,1),
(4,'2025-12-08 14:35:53.753412','2','staff2',1,'[{\"added\": {}}]',13,1),
(5,'2025-12-08 14:36:19.286740','4','staff3@gmail.com',1,'[{\"added\": {}}]',4,1),
(6,'2025-12-08 14:36:41.868926','3','staff3',1,'[{\"added\": {}}]',13,1),
(7,'2025-12-08 14:42:18.655261','1','Dress',1,'[{\"added\": {}}]',10,1),
(8,'2025-12-08 14:42:25.171286','2','Shoes',1,'[{\"added\": {}}]',10,1),
(9,'2025-12-08 14:42:36.466796','3','Watches',1,'[{\"added\": {}}]',10,1),
(10,'2025-12-08 14:44:17.154281','1','Shirts',1,'[{\"added\": {}}]',14,1),
(11,'2025-12-08 14:44:25.015477','2','jeans',1,'[{\"added\": {}}]',14,1),
(12,'2025-12-08 14:44:31.372424','3','Hoodies',1,'[{\"added\": {}}]',14,1),
(13,'2025-12-08 14:45:18.817074','4','Cargopants',1,'[{\"added\": {}}]',14,1),
(14,'2025-12-08 14:45:27.475454','2','Jeans',2,'[{\"changed\": {\"fields\": [\"sub_category_name\"]}}]',14,1),
(15,'2025-12-08 14:45:42.664122','5','Sweatshirts',1,'[{\"added\": {}}]',14,1),
(16,'2025-12-08 14:46:23.335988','3','Watch',2,'[{\"changed\": {\"fields\": [\"category_name\"]}}]',10,1),
(17,'2025-12-08 14:46:51.268777','6','Analog',1,'[{\"added\": {}}]',14,1),
(18,'2025-12-08 14:47:28.087161','7','Digital',1,'[{\"added\": {}}]',14,1),
(19,'2025-12-08 14:47:41.633170','8','smart',1,'[{\"added\": {}}]',14,1),
(20,'2025-12-08 14:47:54.883977','9','Boots',1,'[{\"added\": {}}]',14,1),
(21,'2025-12-08 14:48:05.761045','10','Sneakers',1,'[{\"added\": {}}]',14,1),
(22,'2025-12-08 14:58:50.258459','5','Monochrome ZipCollar Pullover',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(23,'2025-12-08 14:59:01.229324','4','Urban Streetwear Hoodie',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(24,'2025-12-08 14:59:11.604446','3','Grey Zip Up Hoodie',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(25,'2025-12-08 14:59:21.215295','2','Beige Quarter Zip Pullover',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(26,'2025-12-08 14:59:31.905640','1','Lymio Men Cargo Pants',2,'[{\"changed\": {\"fields\": [\"brand\", \"status\"]}}]',12,1),
(27,'2025-12-09 09:25:26.347592','8','Solid Brown Pullover Hoodie',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(28,'2025-12-09 09:25:37.626358','7','Charcoal Gray Relaxed Fit Cargo Pants',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(29,'2025-12-09 09:25:48.901576','6','Olive Green Straight Fit Cargo Pants',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(30,'2025-12-09 10:26:29.147774','23','White Loose Fit Denim Jeans',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(31,'2025-12-09 10:26:35.967268','22','Black Acid-Wash Relaxed Fit Jeans',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(32,'2025-12-09 10:26:42.542092','21','Light Blue Baggy Fit Denim Jeans',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(33,'2025-12-09 10:26:48.413802','20','Stone Gray Relaxed Fit Denim Jeans',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(34,'2025-12-09 10:26:54.559174','19','Dark Brown Solid Formal Shirt',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(35,'2025-12-09 10:27:10.260937','18','White Button-Down Casual Shirt',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(36,'2025-12-09 10:27:18.889970','17','Olive Green Textured Casual Shirt',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(37,'2025-12-09 10:27:25.552776','16','Light Grey Striped Casual Shirt',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(38,'2025-12-09 10:27:38.911146','15','Light Blue PARIS Printed Sweatshirt',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(39,'2025-12-09 10:27:46.416874','14','Light Beige Crew Neck Sweatshirt',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(40,'2025-12-09 10:27:54.105483','13','Brown and Black Colorblock Half Zip sweatshirt',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(41,'2025-12-09 10:28:01.841690','12','Peach  Graphic Hoodie',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(42,'2025-12-09 10:28:12.974978','11','Black Batman Graphic Hoodie',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(43,'2025-12-09 10:28:20.551353','10','Light Gray Tapered Cargo Joggers',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(44,'2025-12-09 10:28:30.209851','9','Jet Black Tapered Fit Cargo Pants',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(45,'2025-12-09 10:35:45.261719','6','staff4@gmail.com',1,'[{\"added\": {}}]',4,1),
(46,'2025-12-09 10:36:07.604631','4','staff4',1,'[{\"added\": {}}]',13,1),
(47,'2025-12-09 10:39:08.532969','11','Loafers',1,'[{\"added\": {}}]',14,1),
(48,'2025-12-09 10:39:24.331917','12','Formal',1,'[{\"added\": {}}]',14,1),
(49,'2025-12-09 11:22:48.139147','35','Braided Buckle Leather Loafers',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(50,'2025-12-09 11:22:54.884918','34','Dark Gray Bit Loafers',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(51,'2025-12-09 11:23:02.507811','33','Gloss Black Buckle Loafers',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(52,'2025-12-09 11:23:09.129677','32','Black Woven Detail Slip-On Loafers',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(53,'2025-12-09 11:23:17.261923','31','Beige Air-Cushion Lifestyle Sneakers',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(54,'2025-12-09 11:23:25.501784','30','Branch Graphic Streetwear Sneakers',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(55,'2025-12-09 11:23:31.950030','29','Green & White Panel Sneakers',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(56,'2025-12-09 11:23:39.769158','28','White Minimalist Sneakers',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(57,'2025-12-09 11:23:52.704108','27','Black Tactical Lace-Up Boots',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(58,'2025-12-09 11:24:00.323145','26','Dark Brown Leather Chelsea Boots',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(59,'2025-12-09 11:24:06.745688','25','Brown Rugged Outdoor Boots',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(60,'2025-12-09 11:24:30.909076','24','Brown Textured Leather Lace-Up Boots',2,'[{\"changed\": {\"fields\": [\"product_name\", \"status\"]}}]',12,1),
(61,'2025-12-09 13:41:08.336547','39','Black Buckle Formal Leather Shoes',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(62,'2025-12-09 13:41:14.011782','38','Black Classic Lace-Up Dress Shoes',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(63,'2025-12-09 13:41:19.559453','37','Brown Elastic Panel Dress Loafers',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(64,'2025-12-09 13:41:26.665971','36','Brown Suede & Leather Brogue Oxfords',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(65,'2025-12-09 14:20:34.202459','51','Sleek Black Strap Smartwatch with Abstract Display',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(66,'2025-12-09 14:20:42.740927','50','Black Metal Smartwatch with Cityscape Display',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(67,'2025-12-09 14:20:49.504062','48','Black Dial Multi-Function Smartwatch',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(68,'2025-12-09 14:21:01.923960','49','Square Display App-Integrated Smartwatch',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(69,'2025-12-09 14:21:09.152710','47','Black & Blue Water-Resistant Digital Watch',2,'[{\"changed\": {\"fields\": [\"brand\", \"status\"]}}]',12,1),
(70,'2025-12-09 14:21:21.112991','46','Black Multi-Function Digital Watch',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(71,'2025-12-09 14:21:28.325911','45','Transparent Dual-Display DigitalWatch',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(72,'2025-12-09 14:21:35.035598','44','Casio F-W Classic Digital Watch',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(73,'2025-12-09 14:21:52.437502','43','Rectangular Black Dial Silver Band Watch',2,'[{\"changed\": {\"fields\": [\"description\", \"status\"]}}]',12,1),
(74,'2025-12-09 14:22:04.146600','42','Square Black Dial Gold Accent Watch',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(75,'2025-12-09 14:22:11.231501','41','Black Dial Rose Gold Accent Watch',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(76,'2025-12-09 14:22:18.812259','40','Black Dial Minimalist Date Watch',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),
(77,'2025-12-09 14:25:36.837623','1','Hub',1,'[{\"added\": {}}]',3,1),
(78,'2025-12-09 14:27:03.663587','7','group@gmail.com',1,'[{\"added\": {}}]',4,1),
(79,'2025-12-09 14:30:58.530884','7','group@gmail.com',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\", \"groups\"]}}]',4,1),
(80,'2025-12-09 14:31:43.236726','1','vijo',2,'[{\"changed\": {\"fields\": [\"delivery_status\"]}}]',7,7),
(81,'2025-12-09 14:34:59.437955','2','vijo',2,'[{\"changed\": {\"fields\": [\"delivery_status\"]}}]',7,7),
(82,'2025-12-09 14:35:17.793119','3','vijo',2,'[{\"changed\": {\"fields\": [\"delivery_status\"]}}]',7,7);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'shop_app','booking'),
(8,'shop_app','buyer'),
(9,'shop_app','cart'),
(10,'shop_app','category'),
(16,'shop_app','checkout'),
(11,'shop_app','feedback'),
(12,'shop_app','products'),
(17,'shop_app','returnproduct'),
(13,'shop_app','staff'),
(14,'shop_app','sub_category'),
(15,'shop_app','wishlist');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2025-12-08 14:30:01.867463'),
(2,'auth','0001_initial','2025-12-08 14:30:02.477593'),
(3,'admin','0001_initial','2025-12-08 14:30:02.645888'),
(4,'admin','0002_logentry_remove_auto_add','2025-12-08 14:30:02.668506'),
(5,'contenttypes','0002_remove_content_type_name','2025-12-08 14:30:02.762201'),
(6,'auth','0002_alter_permission_name_max_length','2025-12-08 14:30:02.821011'),
(7,'auth','0003_alter_user_email_max_length','2025-12-08 14:30:02.879188'),
(8,'auth','0004_alter_user_username_opts','2025-12-08 14:30:02.900795'),
(9,'auth','0005_alter_user_last_login_null','2025-12-08 14:30:02.958919'),
(10,'auth','0006_require_contenttypes_0002','2025-12-08 14:30:02.973316'),
(11,'auth','0007_alter_validators_add_error_messages','2025-12-08 14:30:02.991668'),
(12,'auth','0008_alter_user_username_max_length','2025-12-08 14:30:03.051625'),
(13,'auth','0009_alter_user_last_name_max_length','2025-12-08 14:30:03.108484'),
(14,'sessions','0001_initial','2025-12-08 14:30:03.171569'),
(15,'shop_app','0001_initial','2025-12-08 14:30:04.518813'),
(16,'shop_app','0002_auto_20251125_2020','2025-12-08 14:30:04.648473'),
(17,'shop_app','0003_auto_20251128_1456','2025-12-08 14:30:04.956602'),
(18,'shop_app','0004_products_size','2025-12-08 14:30:05.014077'),
(19,'shop_app','0005_cart_size','2025-12-08 14:30:05.091026'),
(20,'shop_app','0006_auto_20251202_1054','2025-12-08 14:30:05.374188'),
(21,'shop_app','0007_booking_date','2025-12-08 14:30:05.468976'),
(22,'shop_app','0008_remove_feedback_staff','2025-12-08 14:30:05.562636'),
(23,'shop_app','0009_booking_delivered_at','2025-12-08 14:30:05.627279'),
(24,'shop_app','0010_returnproduct','2025-12-08 14:30:05.734868'),
(25,'shop_app','0011_feedback_booking','2025-12-08 14:30:05.888156');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('82og3cuc44y6g78cd6g43lmbxbdtgf24','N2UxZGZlMGQyODE5MjY4YzgxZTA3NWM3M2E1NGU4YjRkYjNkYzc4YTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxM2Y5NTJhZGI5OGY0NDUwOTlhNjRiYWI3ZjE4NWQyYmJhYTRmYzJlIn0=','2025-12-23 14:31:22.014084'),
('rwtjiab4hr5slfeqp413u7fkyb00847s','NmE2YmQ2NTU2Yjc2MjZkZGUyNjZlMTdlZjIzMGUwMzQ5ODZjY2ZmNDp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmN2MxNzkzYTIyOGM3NmZjMTRmNzMzYzhhY2ZhNzlmNGQ0ZDYyM2ZkIn0=','2025-12-23 14:31:53.188675');

/*Table structure for table `shop_app_booking` */

DROP TABLE IF EXISTS `shop_app_booking`;

CREATE TABLE `shop_app_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `delivery_status` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `delivered_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_app_booking_buyer_id_2d819a3f_fk_shop_app_buyer_id` (`buyer_id`),
  KEY `shop_app_booking_product_id_a94d0a08_fk_shop_app_products_id` (`product_id`),
  CONSTRAINT `shop_app_booking_buyer_id_2d819a3f_fk_shop_app_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `shop_app_buyer` (`id`),
  CONSTRAINT `shop_app_booking_product_id_a94d0a08_fk_shop_app_products_id` FOREIGN KEY (`product_id`) REFERENCES `shop_app_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_booking` */

insert  into `shop_app_booking`(`id`,`quantity`,`total_amount`,`status`,`buyer_id`,`product_id`,`delivery_status`,`date`,`delivered_at`) values 
(1,1,279.2,'Paid',1,4,'Delivered','2025-12-08 15:14:05.334072','2025-12-09'),
(2,1,599,'Paid',1,2,'Delivered','2025-12-09 14:34:12.167007','2025-12-09'),
(3,1,799,'Paid',1,3,'Out For Delivery','2025-12-09 14:34:12.181883',NULL);

/*Table structure for table `shop_app_buyer` */

DROP TABLE IF EXISTS `shop_app_buyer`;

CREATE TABLE `shop_app_buyer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_app_buyer_user_id_7e00b32a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_app_buyer_user_id_7e00b32a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_buyer` */

insert  into `shop_app_buyer`(`id`,`name`,`email`,`phone`,`address`,`city`,`pincode`,`user_id`) values 
(1,'vijo','vijo9905@gmail.com',9562504163,'Marottichal','Thrissur',680014,5);

/*Table structure for table `shop_app_cart` */

DROP TABLE IF EXISTS `shop_app_cart`;

CREATE TABLE `shop_app_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_app_cart_buyer_id_9054dfd9_fk_shop_app_buyer_id` (`buyer_id`),
  KEY `shop_app_cart_product_id_a28ff735_fk_shop_app_products_id` (`product_id`),
  CONSTRAINT `shop_app_cart_buyer_id_9054dfd9_fk_shop_app_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `shop_app_buyer` (`id`),
  CONSTRAINT `shop_app_cart_product_id_a28ff735_fk_shop_app_products_id` FOREIGN KEY (`product_id`) REFERENCES `shop_app_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_cart` */

/*Table structure for table `shop_app_category` */

DROP TABLE IF EXISTS `shop_app_category`;

CREATE TABLE `shop_app_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_category` */

insert  into `shop_app_category`(`id`,`category_name`) values 
(1,'Dress'),
(2,'Shoes'),
(3,'Watch');

/*Table structure for table `shop_app_checkout` */

DROP TABLE IF EXISTS `shop_app_checkout`;

CREATE TABLE `shop_app_checkout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `address` longtext,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_app_checkout_buyer_id_922addad_fk_shop_app_buyer_id` (`buyer_id`),
  KEY `shop_app_checkout_product_id_70894ebe_fk_shop_app_products_id` (`product_id`),
  CONSTRAINT `shop_app_checkout_buyer_id_922addad_fk_shop_app_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `shop_app_buyer` (`id`),
  CONSTRAINT `shop_app_checkout_product_id_70894ebe_fk_shop_app_products_id` FOREIGN KEY (`product_id`) REFERENCES `shop_app_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_checkout` */

insert  into `shop_app_checkout`(`id`,`first_name`,`last_name`,`email`,`phone`,`address`,`country`,`state`,`city`,`pin`,`quantity`,`total_amount`,`buyer_id`,`product_id`) values 
(1,'vijo','Varghese','vijo9905@gmail.com',9562504163,'Marottichal','India','kerala','thrissur',680014,1,349,1,4),
(2,'vijo','Varghese','vijo9905@gmail.com',9562504163,'Marottichal','India','kerala','thrissur',680014,1,599,1,2),
(3,'vijo','Varghese','vijo9905@gmail.com',9562504163,'Marottichal','India','kerala','thrissur',680014,1,799,1,3);

/*Table structure for table `shop_app_feedback` */

DROP TABLE IF EXISTS `shop_app_feedback`;

CREATE TABLE `shop_app_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_app_feedback_buyer_id_d5666547_fk_shop_app_buyer_id` (`buyer_id`),
  KEY `shop_app_feedback_product_id_077431bb_fk_shop_app_products_id` (`product_id`),
  KEY `shop_app_feedback_booking_id_5ba7b792_fk_shop_app_booking_id` (`booking_id`),
  CONSTRAINT `shop_app_feedback_booking_id_5ba7b792_fk_shop_app_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `shop_app_booking` (`id`),
  CONSTRAINT `shop_app_feedback_buyer_id_d5666547_fk_shop_app_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `shop_app_buyer` (`id`),
  CONSTRAINT `shop_app_feedback_product_id_077431bb_fk_shop_app_products_id` FOREIGN KEY (`product_id`) REFERENCES `shop_app_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_feedback` */

insert  into `shop_app_feedback`(`id`,`feedback`,`date`,`buyer_id`,`product_id`,`booking_id`) values 
(1,'good product,good quality material','2025-12-09',1,4,1);

/*Table structure for table `shop_app_products` */

DROP TABLE IF EXISTS `shop_app_products`;

CREATE TABLE `shop_app_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `description` longtext,
  `image` varchar(100) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `Staff_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `image2` varchar(100) DEFAULT NULL,
  `image3` varchar(100) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_app_products_Staff_id_815d1e81_fk_shop_app_staff_id` (`Staff_id`),
  KEY `shop_app_products_category_id_fa502784_fk_shop_app_category_id` (`category_id`),
  KEY `shop_app_products_sub_category_id_4c7f19d6_fk_shop_app_` (`sub_category_id`),
  CONSTRAINT `shop_app_products_category_id_fa502784_fk_shop_app_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_app_category` (`id`),
  CONSTRAINT `shop_app_products_Staff_id_815d1e81_fk_shop_app_staff_id` FOREIGN KEY (`Staff_id`) REFERENCES `shop_app_staff` (`id`),
  CONSTRAINT `shop_app_products_sub_category_id_4c7f19d6_fk_shop_app_` FOREIGN KEY (`sub_category_id`) REFERENCES `shop_app_sub_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_products` */

insert  into `shop_app_products`(`id`,`product_name`,`brand`,`price`,`stock`,`description`,`image`,`status`,`Staff_id`,`category_id`,`sub_category_id`,`image2`,`image3`,`size`) values 
(1,'Lymio Men Cargo Pants','Lymio',599,56,'Casual cotton cargo pants with side flap and zipper pockets, ideal for everyday wear','media/cargo11_Viagkcv.jpg','Approved',1,1,4,'media/cargo12_etgu3uV.jpg','media/cargo13_tohpSKo.jpg','XS,M,L,XL'),
(2,'Beige Quarter Zip Pullover','Roadster',599,55,'Soft cotton sweatshirt with stand-up collar and ribbed trim. Clean, minimal style for casual layering.','media/sweat11_vl4lTpr.jpg','Approved',1,1,5,'media/sweat12_6NL8RYI.jpg','media/sweat13_P6kK5z5.jpg','S,M,L,XL'),
(3,'Grey Zip Up Hoodie','Roadster',799,55,'Soft cotton hoodie with drawstring hood and front zipper. Casual comfort for everyday wear.','media/hoodie11_MCh8UGt.jpg','Approved',1,1,3,'media/hoodie12_fuF4xrJ.jpg','media/hoodie13_au7aYTL.jpg','XS,M,L'),
(4,'Urban Streetwear Hoodie','Huetrap',349,55,'Light blue hoodie with bold printed graphics and NYC-inspired design. Casual and trendy streetwear.','media/hoodie21_sbxnq7C.jpg','Approved',1,1,3,'media/hoodie22_293RabT.jpg','media/hoodie23_PuEGClw.jpg','S,M,L,XL'),
(5,'Monochrome ZipCollar Pullover','Huetrap',849,56,'Stylish black-and-white pullover with ribbed center panel and zip collar. Ideal for modern layering.','media/sweat21_HYlnX9s.jpg','Approved',1,1,5,'media/sweat22_WX2HR1O.jpg','media/sweat23_sRwv3Lr.jpg','XS,S,M,L'),
(6,'Olive Green Straight Fit Cargo Pants','Urban Edge',399,56,'Step into rugged style with these olive green cargo pants featuring a straight fit and flap utility pockets. Crafted from durable cotton-blend fabric, they offer all-day comfort and a street-ready vibe. Pair them with sneakers and a solid tee for an effortlessly cool look','media/cargo21_CseZtSt.jpg','Approved',1,1,4,'media/cargo22_tky4AOl.jpg','media/cargo23_mvwhz65.jpg','XS,S,M,L'),
(7,'Charcoal Gray Relaxed Fit Cargo Pants','StreetMode',699,45,'Amp up your casual game with these charcoal gray cargo pants featuring a relaxed fit and utility-style flap pockets. Made from sturdy cotton twill, they offer both comfort and edge. Ideal for streetwear enthusiasts, these cargos pair well with high-top sneakers and oversized tees.','media/cargo31_qW1sSbd.jpg','Approved',1,1,4,'media/cargo32_htxutVX.jpg','media/cargo33_fHsfyF1.jpg','S,M,L,XL,XXL'),
(8,'Solid Brown Pullover Hoodie','WYTHE Essentials',999,23,'Keep it minimal and cozy with this solid brown hoodie featuring a soft fleece lining, kangaroo pocket, and metal-tipped drawstrings. Designed for everyday comfort, it’s perfect for layering or solo wear. Pair it with cargos or joggers for a laid-back streetwear vibe.','media/hoodie31.jpg','Approved',1,1,3,'media/hoodie32.jpg','media/hoodie33.jpg','XS,S,M,L,XL'),
(9,'Jet Black Tapered Fit Cargo Pants','CoreLayer',1099,13,'Make a bold statement with these jet black cargo pants featuring a tapered silhouette and oversized flap pockets. Built for comfort and edge, the cotton-blend fabric ensures durability while the sleek finish adds urban appeal. Pair with monochrome layers and sneakers for a sharp streetwear look.','media/cargo41.jpg','Approved',1,1,4,'media/cargo42.jpg','media/cargo43.jpg','XS,S,M,L'),
(10,'Light Gray Tapered Cargo Joggers','DriftWear',449,13,'Blend comfort and street style with these light gray cargo joggers featuring a tapered fit, elastic cuffs, and a utility flap pocket. The drawstring waist ensures a snug fit while the soft cotton blend keeps it breathable. Ideal for off-duty looks, pair with sneakers and a graphic tee for urban flair','media/cargo51.jpg','Approved',1,1,4,'media/cargo52.jpg','media/cargo53.jpg','XS,S,M,L'),
(11,'Black Batman Graphic Hoodie','CHOICEHUB',1099,45,'Channel your inner vigilante with this black Batman hoodie featuring a bold chest logo and metallic-tipped drawstrings. Crafted for comfort and style, it’s perfect for fans who want to rep Gotham’s hero in everyday streetwear. Pair it with cargos or joggers for a sleek, heroic vibe.','media/hoodie41.jpg','Approved',1,1,3,'media/hoodie42.jpg','media/hoodie43.jpg','S,M,L,XL'),
(12,'Peach  Graphic Hoodie','VEIRDO',999,45,'Add a pop of color to your streetwear rotation with this peach hoodie featuring bold VEIRDO branding. Designed with a relaxed fit, soft fleece lining, and metal-tipped drawstrings, it’s perfect for casual days and urban hangouts. Pair it with cargos or denim for a standout look.','media/hodie51.jpg','Approved',1,1,3,'media/hoodie52.jpg','media/hoodie53.jpg','M,L,XL,XXL'),
(13,'Brown and Black Colorblock Half Zip sweatshirt','TrackLayer',349,23,'Sport meets street in this brown and black half-zip hoodie featuring contrast sleeves and triple-stripe detailing. With ribbed cuffs, a snug hem, and a sleek zip-up neckline, it’s built for comfort and style. Ideal for layering, this hoodie adds an athletic edge to your casual wardrobe.','media/sweat31.jpg','Approved',1,1,5,'media/sweat32.jpg','media/sweat33.jpg','S,M,L,XL'),
(14,'Light Beige Crew Neck Sweatshirt','UrbanLayer',899,34,'Keep it clean and contemporary with this light beige sweatshirt featuring a classic crew neckline and ribbed detailing. Made from soft cotton-blend fabric, it’s perfect for layering or solo wear. Pair it with dark denim and accessories for a refined street-ready look','media/sweat41.jpg','Approved',1,1,5,'media/sweat42.jpg','media/sweat43.jpg','S,M,L,XL,XXL'),
(15,'Light Blue PARIS Printed Sweatshirt','MetroMode',799,23,'Keep it sleek and modern with this light blue sweatshirt featuring bold “PARIS” typography and vertical line detailing. Crafted from soft cotton-blend fabric with a classic crew neck, it’s perfect for minimalists who love clean design. Pair it with dark jeans or joggers for a refined urban look','media/sweat51.jpg','Approved',1,1,5,'media/sweat52.jpg','media/sweat53.jpg','S,M,L,XL,XXL'),
(16,'Light Grey Striped Casual Shirt','ModeCraft',349,34,'Elevate your smart-casual wardrobe with this light grey striped shirt featuring a chest pocket and roll-up sleeves. Crafted from breathable cotton, it offers a tailored fit and versatile styling. Perfect for both office hours and weekend outings, pair it with black trousers or chinos for a refined look','media/shirt11.jpg','Approved',1,1,1,'media/shirt12.jpg','media/shirt13.jpg','XS,S,M,L,XL'),
(17,'Olive Green Textured Casual Shirt','ModeCraft',699,34,'Add depth to your wardrobe with this olive green textured shirt featuring a subtle waffle pattern and sleek black buttons. Designed for a modern fit with roll-up sleeves, it’s perfect for casual outings or smart layering. Pair it with dark trousers and accessories for a polished street-style look.','media/shirt21.jpg','Approved',1,1,1,'media/shirt22.jpg','media/shirt23.jpg','S,M,XL,XXL'),
(18,'White Button-Down Casual Shirt','ModeCraft',599,34,'Keep it crisp with this white button-down shirt featuring black buttons and a chest pocket. Tailored for a clean silhouette, it’s crafted from breathable cotton for all-day comfort. Ideal for both casual and semi-formal looks, pair it with dark trousers and a watch for understated style.','media/shirt31.jpg','Approved',1,1,1,'media/shirt32.jpg','media/shirt33.jpg','S,M,L,XL'),
(19,'Dark Brown Solid Formal Shirt','ModeCraft',699,34,'Refine your office look with this dark brown button-up shirt featuring a structured collar and clean silhouette. Made from breathable cotton fabric, it offers all-day comfort with a polished finish. Pair it with beige chinos or trousers for a smart, professional vibe.','media/shirt41.jpg','Approved',1,1,1,'media/shirt42.jpg','media/shirt43.jpg','XS,S,M,L'),
(20,'Stone Gray Relaxed Fit Denim Jeans','CoreLayer',599,23,'Keep it casual with these stone gray denim jeans featuring a relaxed straight-leg silhouette and clean finish. Designed for comfort and movement, they pair effortlessly with tees, hoodies, or shirts for a laid-back streetwear vibe. Ideal for everyday wear with a touch of edge.','media/jeans11.jpg','Approved',1,1,2,'media/jeans12.jpg','media/jeans13.jpg','XS,S,M,XL,XXL'),
(21,'Light Blue Baggy Fit Denim Jeans','CoreLayer',699,67,'Embrace laid-back style with these light blue baggy jeans featuring a relaxed straight-leg cut and soft faded wash. Designed for comfort and movement, they’re perfect for streetwear looks. Pair with oversized tees and sneakers for a cool, effortless vibe','media/jeans21.jpg','Approved',1,1,2,'media/jeans22.jpg','media/jeans23.jpg','S,M,L'),
(22,'Black Acid-Wash Relaxed Fit Jeans','CoreLayer',899,34,'-  Add edge to your everyday style with these black acid-wash jeans featuring a relaxed fit and faded texture. Crafted for comfort with a streetwear attitude, they pair effortlessly with tees and sneakers. A go-to piece for bold, laid-back looks.','media/jeans31.jpg','Approved',1,1,2,'media/jeans32.jpg','media/jeans33.jpg','M,L,XL,XXL'),
(23,'White Loose Fit Denim Jeans','CoreLayer',1099,45,'Brighten up your streetwear with these white denim jeans featuring a relaxed, loose fit and clean finish. Designed for comfort and standout style, they pair effortlessly with dark tops and bold accessories. A versatile piece for urban looks with contrast and edge.','media/jeans41.jpg','Approved',1,1,2,'media/jeans42.jpg','media/jeans43.jpg','M,L,XL,XXL'),
(24,'Brown Textured Leather Lace-Up Boots','ForgeStep',899,45,'Step into rugged sophistication with these brown leather lace-ups featuring a textured finish and durable black soles. Designed for casual and semi-formal wear, the deep tread pattern ensures grip and comfort. Pair them with denim or chinos for a grounded, versatile look.','media/boot11.jpg','Approved',3,2,9,'media/boot12.jpg','media/boot13.jpg','7,8,9,10'),
(25,'Brown Rugged Outdoor Boots','ForgeStep',2999,14,'Built for adventure, these brown outdoor boots feature padded black collars, gold eyelets, and bold tread soles with red accents. The textured leather and contrast stitching add durability and style. Ideal for hikes or urban treks, they pair well with cargos or denim for a tough, ready-for-anything look.','media/boot21.jpg','Approved',3,2,9,'media/boot22.jpg','media/boot23.jpg','7,8,9,10'),
(26,'Dark Brown Leather Chelsea Boots','ForgeStep',3999,45,'Elevate your footwear game with these dark brown Chelsea boots featuring a sleek leather finish, elastic side panels, and a sturdy low-heel sole. Designed for effortless style and all-day comfort, they’re perfect for both rugged and refined looks. Pair with denim or tailored trousers for versatile appeal','media/boot31.jpg','Approved',3,2,9,'media/boot32.jpg','media/boot3.jpg','7,8,9,10'),
(27,'Black Tactical Lace-Up Boots','ForgeStep',6099,45,'Engineered for durability, these black leather boots feature reinforced toe caps, metal eyelets, and rugged soles built for heavy-duty use. With a padded tongue and “Commando” label detail, they’re ideal for tactical, work, or outdoor environments. Pair them with cargos or utility wear for a bold, functional look.','media/boot41.jpg','Approved',3,2,9,'media/boot42.jpg','media/boot43.jpg','7,8,9,10'),
(28,'White Minimalist Sneakers','ForgeStep',499,56,'Clean lines meet modern flair in these white sneakers featuring a thick sole, detailed stitching, and a subtle orange tag near the heel. Designed for everyday comfort and style, they’re perfect for pairing with denim, joggers, or layered streetwear fits','media/sneak11.jpg','Approved',3,2,10,'media/sneak12.jpg','media/sneak13.jpg','6,8,9,10'),
(29,'Green & White Panel Sneakers','Nivia',3999,78,'Step up your style with these green and white sneakers featuring layered panel construction and clean stitching. With a cushioned sole and classic lace-up design, they’re built for comfort and everyday flair. Perfect for pairing with denim, joggers, or casual fits that need a pop of contrast','media/sneak21.jpg','Approved',3,2,10,'media/sneak22.jpg','media/sneak23.jpg','7,8,9,10'),
(30,'Branch Graphic Streetwear Sneakers','UrbanNest',699,56,'Make a statement with these streetwear sneakers featuring bold tree-branch side panels and “WORKING” text. The layered brown, white, and black design is paired with a thick sole and tread accents for standout style and comfort. Perfect for expressive fits and everyday edge','media/sneak31.jpg','Approved',3,2,10,'media/sneak32.jpg','media/sneak33.jpg','7,8,9,10'),
(31,'Beige Air-Cushion Lifestyle Sneakers','VaultStep',5499,45,'Designed for comfort and style, these beige sneakers feature a cushioned sole with visible air pockets, a circular side logo, and clean stitch detailing. The neutral tone and modern silhouette make them perfect for everyday wear, pairing effortlessly with joggers, denim, or layered streetwear fits','media/sneak41.jpg','Approved',3,2,10,'media/sneak42.jpg','media/sneak43.jpg','7,8,9,10'),
(32,'Black Woven Detail Slip-On Loafers','DriftLayer',399,45,'- Crafted for casual elegance, these black leather slip-ons feature intricate woven detailing, a button accent, and textured soles for grip and comfort. Ideal for laid-back days or refined streetwear, they pair effortlessly with denim or chinos for a clean, confident look.','media/loafer11.jpg','Approved',3,2,11,'media/loafer12.jpg','media/loafer13.jpg','6,7,8,9'),
(33,'Gloss Black Buckle Loafers','Ninth Thread',499,23,'Refined and sleek, these gloss black loafers feature metallic buckle detailing and a polished leather finish. Designed for formal occasions and business attire, they offer a sharp silhouette with premium craftsmanship. Pair with tailored trousers or suits for a confident, elevated look','media/loafer21.jpg','Approved',3,2,11,'media/loafer22.jpg','media/loafer23.jpg','7,8,9,10'),
(34,'Dark Gray Bit Loafers','VantaWear',699,45,'Sleek and versatile, these dark gray loafers feature polished leather, visible edge stitching, and a metal bit detail across the front. Designed for comfort with textured grip soles, they’re perfect for formal or semi-formal wear. Pair with tailored trousers or smart denim for a refined finish','media/loafer31.jpg','Approved',3,2,11,'media/loafer32.jpg','media/loafer33.jpg','7,8,9,10'),
(35,'Braided Buckle Leather Loafers','EchoForm',2099,23,'- Sophisticated and sleek, these brown leather loafers feature a braided strap with metallic buckles and a polished finish. Designed for formal and semi-formal wear, they offer refined craftsmanship and comfort. Pair with tailored outfits for a sharp, confident look.','media/loafer41.jpg','Approved',3,2,11,'media/loafer42.jpg','media/loafer43.jpg','7,8,9,10'),
(36,'Brown Suede & Leather Brogue Oxfords','FormWalk',3099,34,'Classic meets character in these rich brown Oxfords featuring a blend of smooth leather and suede, detailed with brogue perforations and closed lacing. Ideal for formal wear, they offer timeless style with modern texture contrast. Pair with suits or dress trousers for a polished finish','media/formal11.jpg','Approved',3,2,12,'media/formal12.jpg','media/formal13.jpg','8,9,10'),
(37,'Brown Elastic Panel Dress Loafers','PlainTheory',2999,34,'Minimal and refined, these brown leather loafers feature a sleek silhouette with elastic side panels for easy wear. The polished finish and clean design make them ideal for business or formal settings. Pair with tailored trousers or suits for understated elegance.','media/formal21.jpg','Approved',3,2,12,'media/formal22.jpg','media/formal23.jpg','7,8,9,10'),
(38,'Black Classic Lace-Up Dress Shoes','ThreadNest',5999,23,'Timeless and versatile, these black leather dress shoes feature a smooth finish, rounded toes, and low heels. With a lace-up design and rubber soles for comfort and traction, they’re ideal for formal occasions or business wear. Pair with suits or tailored separates for a sharp, confident look','media/formal31.jpg','Approved',3,2,12,'media/formal32.jpg','media/formal33.jpg','7,8,9,10'),
(39,'Black Buckle Formal Leather Shoes','MonoCraft',2499,23,'Elegance refined — these polished black leather shoes feature a sleek silhouette with side buckle detailing and wooden shoe trees for shape retention. Ideal for formal occasions, they pair seamlessly with suits and evening wear, offering timeless style and premium craftsmanship.','media/formal41.jpg','Approved',3,2,12,'media/formal42.jpg','media/formal43.jpg','7,8,9,10'),
(40,'Black Dial Minimalist Date Watch','CoreHue',999,34,'Sleek and modern, this black wristwatch features a minimalist dial with subtle hour markers and a date window at 6 o’clock. Paired with a polished metal band, it’s designed for everyday elegance and understated style. Perfect for both business and casual wear.','media/analog11_E5J6QcR.jpg','Approved',4,3,6,'media/analog12_1S4hTpt.jpg','media/analog13_ec0o4Va.jpg',NULL),
(41,'Black Dial Rose Gold Accent Watch','LayerMint',899,34,'Elegant and understated, this wristwatch features a black dial with rose gold hour markers and hands, paired with a rich brown leather strap. With minimalist styling and a date window at 6 o’clock, it’s perfect for refined everyday wear or subtle formal flair','media/analog21_nNqtqX2.jpg','Approved',4,3,6,'media/analog22_0VkS5se.jpg','media/analog23_ztxu2d4.jpg',NULL),
(42,'Square Black Dial Gold Accent Watch','LOIS CARON',9999,32,'Bold and refined, this square-dial wristwatch features a glossy black face with gold hour markers and hands. The metallic strap adds polish, while the stylized 12 and spiral 6 o’clock details bring a touch of modern flair. Ideal for formal wear or standout everyday style.','media/analog31.jpg','Approved',4,3,6,'media/analog32.jpg','media/analog33.jpg',NULL),
(43,'Rectangular Black Dial Silver Band Watch','LimeStone',699,23,'Sleek and sophisticated, this wristwatch features a rectangular black dial with minimalist hour markers and a polished silver metal band. Designed for modern elegance, it’s perfect for formal occasions or refined everyday wear. Presented in a cushioned box for a premium finish','media/analog41.jpg','Approved',4,3,6,'media/analog42.jpg','media/analog43.jpg',NULL),
(44,'Casio F-W Classic Digital Watch','Casio',3999,24,'Iconic and reliable, the Casio F-91W features a rectangular digital display with time, date, and alarm functions. Its black resin band and rugged build make it a go-to for everyday wear. Lightweight, water-resistant, and timeless — this watch blends simplicity with legendary durability.','media/digital1_w066LAR.jpg','Approved',4,3,7,'media/digital2_XmhVNZi.jpg','media/digital3_gUewoag.jpg',NULL),
(45,'Transparent Dual-Display DigitalWatch','ClearPulse',399,45,'Bold and multifunctional, this transparent sport watch combines analog hands with digital displays. Featuring world time zones, compass and altimeter buttons, and a rugged shock-resistant build, it’s designed for adventure and style. The clear casing reveals internal mechanics for a futuristic edge.','media/digital31.jpg','Approved',4,3,7,'media/digital32.jpg','media/digital33.jpg',NULL),
(46,'Black Multi-Function Digital Watch','Sonata',699,34,'Built for everyday utility, this black digital watch features alarm, chronograph, date, and day indicators. With labeled function buttons and water resistance, it’s a reliable companion for active lifestyles. The sporty design and clear display make it perfect for casual and outdoor wear.','media/digital21.jpg','Approved',4,3,7,'media/digital22.jpg','media/digital23.jpg',NULL),
(47,'Black & Blue Water-Resistant Digital Watch','StormGrid',649,21,'Rugged and functional, this digital watch features a bold black display ringed with electric blue. With water resistance, day/time display, and multi-function buttons (light, mode, reset, start/stop), it’s built for active lifestyles and outdoor durability. A sleek choice for sport and everyday wear.','media/dgital41.jpg','Approved',4,3,7,'media/digtal42.jpg','media/digital43.jpg',NULL),
(48,'Black Dial Multi-Function Smartwatch','EchoSync',599,45,'Packed with features, this round-face smartwatch offers weather updates, step tracking, altitude data, analog-digital time display, and scheduled alerts. With a sleek black strap and vibrant interface, it’s built for modern lifestyles—balancing fitness, utility, and style in one smart package','media/smart1_BQdsQd5.jpg','Approved',4,3,8,'media/smart2_YH6d6cE.jpg','media/smart3_p4Mu3b5.jpg',NULL),
(49,'Square Display App-Integrated Smartwatch','NovaDash',799,54,'Vibrant and versatile, this smartwatch features a square digital display packed with app icons and smart functions. With a bold orange band and metallic casing, it offers time, date, and seamless access to popular apps. Designed for tech-savvy users who want style and connectivity on the go.','media/smart21.jpg','Approved',4,3,8,'media/smart22.jpg','media/smart23.jpg',NULL),
(50,'Black Metal Smartwatch with Cityscape Display','Noise',1299,45,'Stylish and tech-forward, this smartwatch features a vivid round display with a dynamic cityscape wallpaper. With step tracking, battery status, and time indicators, it blends functionality with visual appeal. The black metallic band adds a premium touch, perfect for modern urban lifestyles.','media/smart31.jpg','Approved',4,3,8,'media/smart32.jpg','media/smart33.jpg',NULL),
(51,'Sleek Black Strap Smartwatch with Abstract Display','Boult',1399,23,'Modern and minimalist, this smartwatch features a rectangular face with a vibrant abstract background. Displaying time, date, and day with clarity, it’s paired with a textured black strap and side button for easy navigation. Ideal for users who value both style and smart functionality.','media/smrt41.jpg','Approved',4,3,8,'media/smart42.jpg','media/smart43.jpg',NULL);

/*Table structure for table `shop_app_returnproduct` */

DROP TABLE IF EXISTS `shop_app_returnproduct`;

CREATE TABLE `shop_app_returnproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_app_returnprodu_booking_id_210c5cb7_fk_shop_app_` (`booking_id`),
  CONSTRAINT `shop_app_returnprodu_booking_id_210c5cb7_fk_shop_app_` FOREIGN KEY (`booking_id`) REFERENCES `shop_app_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_returnproduct` */

/*Table structure for table `shop_app_staff` */

DROP TABLE IF EXISTS `shop_app_staff`;

CREATE TABLE `shop_app_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_app_staff_user_id_2ce1e12a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_app_staff_user_id_2ce1e12a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_staff` */

insert  into `shop_app_staff`(`id`,`name`,`email`,`phone`,`user_id`) values 
(1,'staff1','vijo9905@gmail.com',7898765645,2),
(2,'staff2','vijo9905@gmail.com',7809876567,3),
(3,'staff3','vijo9905@gmail.com',7898456789,4),
(4,'staff4','vijo9905@gmail.com',7788889988,6);

/*Table structure for table `shop_app_sub_category` */

DROP TABLE IF EXISTS `shop_app_sub_category`;

CREATE TABLE `shop_app_sub_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category_name` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_app_sub_categor_category_id_4513829c_fk_shop_app_` (`category_id`),
  CONSTRAINT `shop_app_sub_categor_category_id_4513829c_fk_shop_app_` FOREIGN KEY (`category_id`) REFERENCES `shop_app_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_sub_category` */

insert  into `shop_app_sub_category`(`id`,`sub_category_name`,`category_id`) values 
(1,'Shirts',1),
(2,'Jeans',1),
(3,'Hoodies',1),
(4,'Cargopants',1),
(5,'Sweatshirts',1),
(6,'Analog',3),
(7,'Digital',3),
(8,'smart',3),
(9,'Boots',2),
(10,'Sneakers',2),
(11,'Loafers',2),
(12,'Formal',2);

/*Table structure for table `shop_app_wishlist` */

DROP TABLE IF EXISTS `shop_app_wishlist`;

CREATE TABLE `shop_app_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_app_wishlist_buyer_id_2825aaf0_fk_shop_app_buyer_id` (`buyer_id`),
  KEY `shop_app_wishlist_product_id_52d65527_fk_shop_app_products_id` (`product_id`),
  CONSTRAINT `shop_app_wishlist_buyer_id_2825aaf0_fk_shop_app_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `shop_app_buyer` (`id`),
  CONSTRAINT `shop_app_wishlist_product_id_52d65527_fk_shop_app_products_id` FOREIGN KEY (`product_id`) REFERENCES `shop_app_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `shop_app_wishlist` */

insert  into `shop_app_wishlist`(`id`,`buyer_id`,`product_id`) values 
(1,1,22);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
