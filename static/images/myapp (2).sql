-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 11, 2022 at 12:59 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_emailaddress`
--

INSERT INTO `account_emailaddress` (`id`, `email`, `verified`, `primary`, `user_id`) VALUES
(1, 'houssam@gmail.com', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_email_address_id_5b7f8c58` (`email_address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE IF NOT EXISTS `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('9cb4caf0c61f004007b5cb2567680ca47b283ea4', '2022-06-10 13:54:49.198955', 1),
('87bf31a86caeef44d99c0a7f2a92214ea639e9ee', '2022-06-10 20:12:20.087349', 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add message', 7, 'add_message'),
(26, 'Can change message', 7, 'change_message'),
(27, 'Can delete message', 7, 'delete_message'),
(28, 'Can view message', 7, 'view_message'),
(29, 'Can add pictures', 8, 'add_pictures'),
(30, 'Can change pictures', 8, 'change_pictures'),
(31, 'Can delete pictures', 8, 'delete_pictures'),
(32, 'Can view pictures', 8, 'view_pictures'),
(33, 'Can add offer', 9, 'add_offer'),
(34, 'Can change offer', 9, 'change_offer'),
(35, 'Can delete offer', 9, 'delete_offer'),
(36, 'Can view offer', 9, 'view_offer'),
(37, 'Can add category', 10, 'add_category'),
(38, 'Can change category', 10, 'change_category'),
(39, 'Can delete category', 10, 'delete_category'),
(40, 'Can view category', 10, 'view_category'),
(41, 'Can add site', 11, 'add_site'),
(42, 'Can change site', 11, 'change_site'),
(43, 'Can delete site', 11, 'delete_site'),
(44, 'Can view site', 11, 'view_site'),
(45, 'Can add social application', 12, 'add_socialapp'),
(46, 'Can change social application', 12, 'change_socialapp'),
(47, 'Can delete social application', 12, 'delete_socialapp'),
(48, 'Can view social application', 12, 'view_socialapp'),
(49, 'Can add social account', 13, 'add_socialaccount'),
(50, 'Can change social account', 13, 'change_socialaccount'),
(51, 'Can delete social account', 13, 'delete_socialaccount'),
(52, 'Can view social account', 13, 'view_socialaccount'),
(53, 'Can add social application token', 14, 'add_socialtoken'),
(54, 'Can change social application token', 14, 'change_socialtoken'),
(55, 'Can delete social application token', 14, 'delete_socialtoken'),
(56, 'Can view social application token', 14, 'view_socialtoken'),
(57, 'Can add email address', 15, 'add_emailaddress'),
(58, 'Can change email address', 15, 'change_emailaddress'),
(59, 'Can delete email address', 15, 'delete_emailaddress'),
(60, 'Can view email address', 15, 'view_emailaddress'),
(61, 'Can add email confirmation', 16, 'add_emailconfirmation'),
(62, 'Can change email confirmation', 16, 'change_emailconfirmation'),
(63, 'Can delete email confirmation', 16, 'delete_emailconfirmation'),
(64, 'Can view email confirmation', 16, 'view_emailconfirmation'),
(65, 'Can add Token', 17, 'add_token'),
(66, 'Can change Token', 17, 'change_token'),
(67, 'Can delete Token', 17, 'delete_token'),
(68, 'Can view Token', 17, 'view_token'),
(69, 'Can add token', 18, 'add_tokenproxy'),
(70, 'Can change token', 18, 'change_tokenproxy'),
(71, 'Can delete token', 18, 'delete_tokenproxy'),
(72, 'Can view token', 18, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Table structure for table `base_category`
--

DROP TABLE IF EXISTS `base_category`;
CREATE TABLE IF NOT EXISTS `base_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `base_category`
--

INSERT INTO `base_category` (`id`, `name`) VALUES
(1, 'House'),
(2, 'Flat'),
(3, 'Apartment'),
(4, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `base_message`
--

DROP TABLE IF EXISTS `base_message`;
CREATE TABLE IF NOT EXISTS `base_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `update` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `body` longtext NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_message_room_id_6b04a640` (`room_id`),
  KEY `base_message_user_id_46a57e37` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `base_offer`
--

DROP TABLE IF EXISTS `base_offer`;
CREATE TABLE IF NOT EXISTS `base_offer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `descripation` varchar(500) DEFAULT NULL,
  `update` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `host_id` bigint(20) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `area` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  `mainpic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_room_host_id_6c009082` (`host_id`),
  KEY `base_room_topic_id_42a6b2b8` (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `base_offer`
--

INSERT INTO `base_offer` (`id`, `name`, `descripation`, `update`, `created`, `host_id`, `topic_id`, `price`, `area`, `lat`, `long`, `mainpic`) VALUES
(4, 'Apartment', '', '2022-06-10 09:44:02.764712', '2022-06-10 09:44:02.764712', 1, 4, NULL, NULL, NULL, NULL, '346439_Xhr4Hym.jpg'),
(10, 'test', 'test', '2022-06-10 20:09:47.593878', '2022-06-10 20:09:47.593878', 1, 1, 550, 200, NULL, NULL, ''),
(8, 'test', 'test', '2022-06-10 13:52:51.973692', '2022-06-10 13:52:51.973692', 1, 1, 550, 200, NULL, NULL, ''),
(9, 'test', 'test', '2022-06-10 20:07:44.128848', '2022-06-10 20:07:44.129040', 1, 1, 550, 200, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `base_offer_participants`
--

DROP TABLE IF EXISTS `base_offer_participants`;
CREATE TABLE IF NOT EXISTS `base_offer_participants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `offer_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_room_participants_room_id_user_id_2e298648_uniq` (`offer_id`,`user_id`),
  KEY `base_room_participants_room_id_8701ee11` (`offer_id`),
  KEY `base_room_participants_user_id_2a86ea9a` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `base_offer_participants`
--

INSERT INTO `base_offer_participants` (`id`, `offer_id`, `user_id`) VALUES
(4, 4, 1),
(10, 10, 1),
(8, 8, 1),
(9, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `base_pictures`
--

DROP TABLE IF EXISTS `base_pictures`;
CREATE TABLE IF NOT EXISTS `base_pictures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pic` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `update` datetime(6) NOT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_pictures_room_id_360161ff` (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `base_pictures`
--

INSERT INTO `base_pictures` (`id`, `pic`, `created`, `update`, `room_id`) VALUES
(1, 'money_1oC2YWM.jpg', '2022-06-09 22:44:46.688607', '2022-06-09 22:44:46.688607', NULL),
(5, '346439_BKm9Owj.jpg', '2022-06-10 09:44:02.767705', '2022-06-10 09:44:02.767705', 4),
(15, 'image_picker5220630176733484691.jpg', '2022-06-10 20:09:48.377398', '2022-06-10 20:09:48.377398', 10),
(7, 'house_2tSpuUf.png', '2022-06-10 13:51:09.048259', '2022-06-10 13:51:09.049257', 4),
(8, 'image_picker9149979940559837210.jpg', '2022-06-10 13:52:53.068291', '2022-06-10 13:52:53.068291', 8),
(9, 'image_picker3755725222528016640.jpg', '2022-06-10 13:52:53.266911', '2022-06-10 13:52:53.266911', 8),
(10, 'image_picker7225105260235570116.jpg', '2022-06-10 13:52:53.457673', '2022-06-10 13:52:53.457673', 8),
(11, 'image_picker521373557844111634.jpg', '2022-06-10 13:52:53.593732', '2022-06-10 13:52:53.594729', 8),
(12, 'image_picker4173710615164567173.jpg', '2022-06-10 20:07:48.335648', '2022-06-10 20:07:48.335648', 9),
(13, 'image_picker6903785959297028421.jpg', '2022-06-10 20:07:49.103965', '2022-06-10 20:07:49.103965', 9),
(14, 'image_picker6772820860707415598.jpg', '2022-06-10 20:07:49.674351', '2022-06-10 20:07:49.674351', 9),
(16, 'image_picker4393322194508373169.jpg', '2022-06-10 20:09:48.457978', '2022-06-10 20:09:48.457978', 10),
(17, 'image_picker3087473210753261184.jpg', '2022-06-10 20:09:49.494917', '2022-06-10 20:09:49.494917', 10);

-- --------------------------------------------------------

--
-- Table structure for table `base_user`
--

DROP TABLE IF EXISTS `base_user`;
CREATE TABLE IF NOT EXISTS `base_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `avater` varchar(100) DEFAULT NULL,
  `bio` longtext,
  `phone_number` varchar(20) DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `base_user`
--

INSERT INTO `base_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `avater`, `bio`, `phone_number`, `type`) VALUES
(1, 'pbkdf2_sha256$320000$TqaoEJA1c4OhaKQlciO148$fT0yAUG4lo1XX7nX2oZIva/rJ+bJs4prFbH49jBzwms=', '2022-06-10 21:19:33.390226', 1, 'admin', '', '', 1, 1, '2022-06-09 22:38:29.000000', 'admin@gmail.com', 'received_1758694757796246.jpeg', 'the admin', '0797878007', 'Agency'),
(2, 'pbkdf2_sha256$320000$kUiP1bJv2DtXImCcV375Uq$OKboItilEBQQtOpPB9uROhi8sSTcPjYpkLgplfyNJG8=', '2022-06-10 21:20:00.636272', 0, 'houssam', '', '', 0, 1, '2022-06-10 20:12:19.721679', 'houssam@gmail.com', 'IMG_20220609_062258.jpg', 'I\'m houssam', '437225', 'Client');

-- --------------------------------------------------------

--
-- Table structure for table `base_user_groups`
--

DROP TABLE IF EXISTS `base_user_groups`;
CREATE TABLE IF NOT EXISTS `base_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_user_groups_user_id_group_id_774631b7_uniq` (`user_id`,`group_id`),
  KEY `base_user_groups_user_id_29a796b6` (`user_id`),
  KEY `base_user_groups_group_id_c0eca7d6` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `base_user_user_permissions`
--

DROP TABLE IF EXISTS `base_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `base_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_user_user_permissions_user_id_permission_id_e9093277_uniq` (`user_id`,`permission_id`),
  KEY `base_user_user_permissions_user_id_2eec4d63` (`user_id`),
  KEY `base_user_user_permissions_permission_id_0418bc02` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-06-09 22:39:15.043715', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Bio\", \"Type\", \"Phone number\"]}}]', 6, 1),
(2, '2022-06-09 22:39:51.750294', '1', 'House', 1, '[{\"added\": {}}]', 10, 1),
(3, '2022-06-09 22:39:58.593140', '2', 'Flat', 1, '[{\"added\": {}}]', 10, 1),
(4, '2022-06-09 22:40:16.114738', '3', 'Apartment', 1, '[{\"added\": {}}]', 10, 1),
(5, '2022-06-09 22:40:26.102603', '4', 'Others', 1, '[{\"added\": {}}]', 10, 1),
(6, '2022-06-10 09:24:16.061197', '4', 'Apartment', 1, '[{\"added\": {}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'base', 'user'),
(7, 'base', 'message'),
(8, 'base', 'pictures'),
(9, 'base', 'offer'),
(10, 'base', 'category'),
(11, 'sites', 'site'),
(12, 'allauth', 'socialapp'),
(13, 'allauth', 'socialaccount'),
(14, 'allauth', 'socialtoken'),
(15, 'account', 'emailaddress'),
(16, 'account', 'emailconfirmation'),
(17, 'authtoken', 'token'),
(18, 'authtoken', 'tokenproxy');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-09 22:36:39.863135'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-06-09 22:36:39.969238'),
(3, 'auth', '0001_initial', '2022-06-09 22:36:40.334864'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-06-09 22:36:40.380056'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-06-09 22:36:40.390723'),
(6, 'auth', '0004_alter_user_username_opts', '2022-06-09 22:36:40.397672'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-06-09 22:36:40.403655'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-06-09 22:36:40.406647'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-06-09 22:36:40.413019'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-06-09 22:36:40.418464'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-06-09 22:36:40.425446'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-06-09 22:36:40.454667'),
(13, 'auth', '0011_update_proxy_permissions', '2022-06-09 22:36:40.464417'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-06-09 22:36:40.473400'),
(15, 'base', '0001_initial', '2022-06-09 22:36:41.554732'),
(16, 'account', '0001_initial', '2022-06-09 22:36:41.888158'),
(17, 'account', '0002_email_max_length', '2022-06-09 22:36:41.956829'),
(18, 'admin', '0001_initial', '2022-06-09 22:36:42.142998'),
(19, 'admin', '0002_logentry_remove_auto_add', '2022-06-09 22:36:42.184682'),
(20, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-09 22:36:42.195621'),
(21, 'authtoken', '0001_initial', '2022-06-09 22:36:42.287110'),
(22, 'authtoken', '0002_auto_20160226_1747', '2022-06-09 22:36:42.337970'),
(23, 'authtoken', '0003_tokenproxy', '2022-06-09 22:36:42.342555'),
(24, 'base', '0002_alter_user_bio_alter_user_name', '2022-06-09 22:36:42.497952'),
(25, 'base', '0003_user_phone_number_user_type', '2022-06-09 22:36:43.436339'),
(26, 'base', '0004_alter_user_phone_number_alter_user_type', '2022-06-09 22:36:43.526984'),
(27, 'base', '0005_alter_user_type', '2022-06-09 22:36:43.540113'),
(28, 'base', '0006_remove_user_name', '2022-06-09 22:36:43.584334'),
(29, 'base', '0007_alter_room_pic', '2022-06-09 22:36:43.596022'),
(30, 'base', '0008_alter_room_pic', '2022-06-09 22:36:43.610208'),
(31, 'base', '0009_alter_room_pic_host', '2022-06-09 22:36:43.704193'),
(32, 'base', '0010_delete_host', '2022-06-09 22:36:43.709626'),
(33, 'base', '0011_remove_room_pic_picture', '2022-06-09 22:36:43.895808'),
(34, 'base', '0012_room_pic_delete_picture', '2022-06-09 22:36:43.962759'),
(35, 'base', '0013_pictures', '2022-06-09 22:36:44.082525'),
(36, 'base', '0014_remove_room_pic', '2022-06-09 22:36:44.162612'),
(37, 'base', '0015_alter_room_id', '2022-06-09 22:36:47.653268'),
(38, 'base', '0016_alter_room_id', '2022-06-09 22:36:48.311254'),
(39, 'base', '0017_pictures_user', '2022-06-09 22:36:48.463468'),
(40, 'base', '0018_remove_pictures_user', '2022-06-09 22:36:48.596152'),
(41, 'base', '0019_rename_room_offer', '2022-06-09 22:36:48.763327'),
(42, 'base', '0020_offer_price', '2022-06-09 22:36:48.819472'),
(43, 'base', '0021_adress_offer_adress', '2022-06-09 22:36:49.060257'),
(44, 'base', '0022_remove_offer_adress_delete_adress', '2022-06-09 22:36:49.139771'),
(45, 'base', '0023_alter_offer_descripation', '2022-06-09 22:36:49.202147'),
(46, 'base', '0024_offer_mainpic', '2022-06-09 22:36:49.312037'),
(47, 'base', '0025_rename_topic_category_offer_area_offer_bathroom_and_more', '2022-06-09 22:36:49.691043'),
(48, 'base', '0026_remove_offer_mainpic', '2022-06-09 22:36:49.765494'),
(49, 'base', '0027_remove_offer_bathroom_remove_offer_bedroom', '2022-06-09 22:36:50.048166'),
(50, 'base', '0028_offer_mainpic', '2022-06-09 22:36:50.416611'),
(51, 'base', '0029_alter_offer_mainpic', '2022-06-09 22:36:50.449851'),
(52, 'base', '0030_alter_offer_id', '2022-06-09 22:36:51.665025'),
(53, 'base', '0031_alter_offer_id', '2022-06-09 22:36:52.187784'),
(54, 'base', '0032_remove_pictures_room_offer_pictures', '2022-06-09 22:36:52.392089'),
(55, 'base', '0033_remove_offer_mainpic', '2022-06-09 22:36:52.478249'),
(56, 'sessions', '0001_initial', '2022-06-09 22:36:52.581531'),
(57, 'sites', '0001_initial', '2022-06-09 22:36:52.640845'),
(58, 'sites', '0002_alter_domain_unique', '2022-06-09 22:36:52.778532'),
(59, 'base', '0034_alter_pictures_id', '2022-06-09 23:44:51.835776'),
(60, 'base', '0035_alter_pictures_id', '2022-06-09 23:55:38.918779'),
(61, 'base', '0036_remove_offer_latitude_remove_offer_longitude_and_more', '2022-06-10 00:47:00.041931'),
(62, 'base', '0002_offer_mainpic', '2022-06-10 09:30:24.553874');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('86fhrbszj2cujx24t0364ylkkzvxxigp', '.eJxVyk0OwiAQQOG7sDYNlAKDe70GGWaGQOxPIm1iYry7utPte99TJTz2mo4u99RYnZVRp9-WkW6yfgcSbce692HZWOY-XNvjsmCb_33FXj_YBhY_IvkSKWOZhLx1JgOhL5hhik6LDQ7BsmMftB0hiGhwFE0uwOr1Bg1NMiI:1nzQng:WItMZFU6Zmhv7EztjiWGBj7nnmnBNbJNJMP4QRc6Mqg', '2022-06-23 22:38:48.821215'),
('0614jzrg2vhs608nydw7b6fbbyrhps5y', '.eJxVyk0OwiAQQOG7sDYNlAKDe70GGWaGQOxPIm1iYry7utPte99TJTz2mo4u99RYnZVRp9-WkW6yfgcSbce692HZWOY-XNvjsmCb_33FXj_YBhY_IvkSKWOZhLx1JgOhL5hhik6LDQ7BsmMftB0hiGhwFE0uwOr1Bg1NMiI:1nzf69:feY3MX7OrO2XyidOrYwOj8cpHQqyWroeRNOapVy4dWg', '2022-06-24 13:54:49.685187'),
('bdlt39brllskee0gs00c8q80jgxabh5k', '.eJxVyssKwjAQQNF_yVpKXjOx7u1vhGQyQ4J9gGlBEP9d3en23vNUMR17jUfne2xFXZRVp9-WE914_Y5EtB3r3odlKzz3YWqP65La_O9r6vWDcQQIpNmhSPJZLDvjGc9WTBFACUAenc7GZRKvGVzGMWTtNRTRBtTrDeqZMUw:1nzlZV:GLw4hXaocz2plLDRZ1W1VEkrL9sG1SVk9eOcLcYfTvU', '2022-06-24 20:49:33.671593'),
('37fpoqsupuyakvnpgk5tfdx2hb6hbe0y', '.eJxljMsKwjAQRf9l1kWSJpPa7vU3Qh4zNJi20DQiiP-uFhHE7Tnn3ju4EJY6b_ZKa-JE0dLkUoZhrjk3X1sLrTBACw1YV7dxBzbFf-ZduND8Fp9tOUxLpFwO53Q77d8__ejK-IpNj9gFQcowO-25JSU1mWPLMjIa7jBoo4SXygfWglB503deaIGRhUR4PAFTbkLd:1nzkzc:Bb__LGu7T-qrbtVxXElV5U8c97bqPCWH0SA9ZH8OapA', '2022-06-24 20:12:28.327895'),
('g4a90erqeem56v1f6gnpu7ud5gjxjqpd', '.eJxVyk0OwiAQQOG7sDYNlAKDe70GGWaGQOxPIm1iYry7utPte99TJTz2mo4u99RYnZVRp9-WkW6yfgcSbce692HZWOY-XNvjsmCb_33FXj_YBhY_IvkSKWOZhLx1JgOhL5hhik6LDQ7BsmMftB0hiGhwFE0uwOr1Bg1NMiI:1nzm2X:AEafAjprlOdRVEB6Qn4B_fZ3Nqwe7BlE4NIJGwkCUMw', '2022-06-24 21:19:33.391502'),
('eq6tkjit5mqr1hq9kgsyws6tkowdzuae', '.eJxVyssKwjAQQNF_yVpKXjOx7u1vhGQyQ4J9gGlBEP9d3en23vNUMR17jUfne2xFXZRVp9-WE914_Y5EtB3r3odlKzz3YWqP65La_O9r6vWDcQQIpNmhSPJZLDvjGc9WTBFACUAenc7GZRKvGVzGMWTtNRTRBtTrDeqZMUw:1nzm2y:QBrU7vpFn7x6R7tLCLD7_JWS0oSRncAdP-TxFQG8pSA', '2022-06-24 21:20:00.639298');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
