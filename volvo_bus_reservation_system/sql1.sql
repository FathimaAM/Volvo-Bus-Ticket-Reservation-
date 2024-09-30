/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - bus_reservation
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bus_reservation` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bus_reservation`;

/*Table structure for table `booking_child` */

DROP TABLE IF EXISTS `booking_child`;

CREATE TABLE `booking_child` (
  `booking_child_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_master_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `no_of_seat` varchar(100) DEFAULT NULL,
  `from_place_id` int(11) DEFAULT NULL,
  `to_palce_id` int(11) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`booking_child_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `booking_child` */

insert  into `booking_child`(`booking_child_id`,`booking_master_id`,`bus_id`,`no_of_seat`,`from_place_id`,`to_palce_id`,`amount`) values 
(1,1,2,'8',3,4,'800'),
(2,2,2,'2',3,4,'200'),
(3,3,2,'5',3,4,'500'),
(4,4,2,'2',3,4,'200'),
(5,5,4,'3',5,6,'4500'),
(6,6,4,'2',5,6,'3000'),
(8,6,2,'3',3,4,'300');

/*Table structure for table `booking_master` */

DROP TABLE IF EXISTS `booking_master`;

CREATE TABLE `booking_master` (
  `booking_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`booking_master_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `booking_master` */

insert  into `booking_master`(`booking_master_id`,`user_id`,`total`,`date_time`,`status`) values 
(1,1,'800','2022-11-14 15:33:39','paid'),
(2,1,'200','2022-11-14 15:36:28','paid'),
(3,1,'500','2022-11-14 15:37:53','paid'),
(4,2,'200','2022-11-14 15:42:32','paid'),
(5,2,'4500','2022-11-16 07:50:38','paid'),
(6,2,'3300','2022-11-16 07:55:36','pending');

/*Table structure for table `bus` */

DROP TABLE IF EXISTS `bus`;

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_registration` varchar(100) DEFAULT NULL,
  `drive_name` varchar(100) DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `manufacturing_year` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `bus` */

insert  into `bus`(`bus_id`,`bus_registration`,`drive_name`,`phone_no`,`manufacturing_year`,`model`,`latitude`,`route_id`) values 
(1,'KL 07 BW 3993','driver','1234567891','12348','Single-decker ','5447456',1),
(2,'MP O3 MP 4025','driver2','1234567891','2348','Double-decker ','5447456',2),
(3,'AP 43 DY 4951','driver3','1234567890','2016','school bus','5447456',3),
(4,'KL 43 DY 4951','driver3','1234567891','1998','Double-decker ','5447456',4);

/*Table structure for table `cancellation` */

DROP TABLE IF EXISTS `cancellation`;

CREATE TABLE `cancellation` (
  `cancel_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_child_id` int(11) DEFAULT NULL,
  `reason_for_cancellation` varchar(100) DEFAULT NULL,
  `cancel_datetime` varchar(100) DEFAULT NULL,
  `cancellation_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cancel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `cancellation` */

insert  into `cancellation`(`cancel_id`,`booking_child_id`,`reason_for_cancellation`,`cancel_datetime`,`cancellation_status`) values 
(1,1,'nothing','2022-11-14','canceled'),
(2,2,'nothing','2022-11-14','canceled'),
(3,3,'nothing','2022-11-14','canceled'),
(4,4,'nothing','2022-11-14','canceled'),
(5,4,'nothing','2022-11-14','canceled');

/*Table structure for table `fares` */

DROP TABLE IF EXISTS `fares`;

CREATE TABLE `fares` (
  `fare_id` int(11) NOT NULL AUTO_INCREMENT,
  `starting_stop_id` int(11) DEFAULT NULL,
  `ending_stop_id` int(11) DEFAULT NULL,
  `amount_per_seat` varchar(100) DEFAULT NULL,
  `pass_amount` varchar(100) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fare_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `fares` */

insert  into `fares`(`fare_id`,`starting_stop_id`,`ending_stop_id`,`amount_per_seat`,`pass_amount`,`route_id`) values 
(1,1,1,'500','100',1),
(2,2,3,'100','50',2),
(3,1,1,'100','10',3),
(4,4,3,'1500','100',3),
(5,6,4,'1500','1000',4);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `feedback_desc` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`feedback_id`,`user_id`,`feedback_desc`,`date_time`) values 
(1,2,'good','2022-11-14');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'user','user','Users'),
(2,'admin','admin','admin'),
(4,'staff','1234','Staff'),
(5,'12345','12345','Users');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`pay_id`,`user_id`,`booking_id`,`type`,`date_time`,`status`) values 
(1,1,1,'booking','2022-11-14 14:08:45','paid'),
(2,2,1,'booking','2022-11-14 14:10:58','paid'),
(3,1,1,'booking','2022-11-14 14:15:06','paid'),
(4,1,1,'booking','2022-11-14 14:17:45','paid'),
(5,2,1,'booking','2022-11-14 15:34:50','paid'),
(6,2,1,'booking','2022-11-14 15:36:44','paid'),
(7,2,1,'booking','2022-11-14 15:38:06','paid'),
(8,2,2,'booking','2022-11-14 15:42:50','paid'),
(9,4,2,'booking','2022-11-16 07:50:55','paid');

/*Table structure for table `place` */

DROP TABLE IF EXISTS `place`;

CREATE TABLE `place` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`place_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `place` */

insert  into `place`(`place_id`,`place_name`) values 
(1,'tvm'),
(2,'kollam'),
(3,'pala'),
(4,'mala'),
(5,'kotyam'),
(6,'kochi');

/*Table structure for table `route` */

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_name` varchar(100) DEFAULT NULL,
  `starting_place_id` int(11) DEFAULT NULL,
  `ending_place_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `route` */

insert  into `route`(`route_id`,`route_name`,`starting_place_id`,`ending_place_id`) values 
(1,'Chinnakada, Kollam',1,2),
(2,'pala to ernakulam route map',3,4),
(4,'mg road',5,6);

/*Table structure for table `seats` */

DROP TABLE IF EXISTS `seats`;

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_number` varchar(100) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `seat_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `seats` */

insert  into `seats`(`seat_id`,`seat_number`,`bus_id`,`seat_status`) values 
(1,'100',1,'accept'),
(2,'98',2,'pending'),
(3,'150',3,'pending'),
(4,'97',4,'pending');

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `house_name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`login_id`,`first_name`,`last_name`,`gender`,`dob`,`house_name`,`place`,`pincode`,`phone`,`email`) values 
(2,4,'staff','staff','female','2022-11-27','gfhkjhjhnk','kochi','682031','0987654321','staff@gamilcom');

/*Table structure for table `stops` */

DROP TABLE IF EXISTS `stops`;

CREATE TABLE `stops` (
  `stop_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `arriving_date_time` varchar(100) DEFAULT NULL,
  `departure_date_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `stops` */

insert  into `stops`(`stop_id`,`place_id`,`route_id`,`arriving_date_time`,`departure_date_time`) values 
(5,6,4,'2022-11-25T07:46','2022-11-18T07:46'),
(2,2,2,'2022-11-16T13:01','2022-11-18T13:01'),
(3,3,1,'2022-11-16T13:02','2022-12-04T13:02'),
(4,4,2,'2022-12-02T17:49','2022-11-17T17:49'),
(6,5,4,'2022-11-10T07:47','2022-11-25T07:47');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `house_name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`login_id`,`first_name`,`last_name`,`gender`,`dob`,`house_name`,`place`,`pincode`,`phone`,`email`) values 
(1,1,'user','user','female','2022-11-18','dsajdajlkd','ernakulam','682032','2345678907','user@gmail.com'),
(2,5,'user1','user1','male','2022-12-02','dhsajkhdl','kochi','123456','9999999999','user@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
