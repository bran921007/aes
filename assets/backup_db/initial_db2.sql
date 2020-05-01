-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 09, 2016 at 08:11 AM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aes_saas`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(200) NOT NULL,
  `ip_address` varchar(200) NOT NULL,
  `user_agent` varchar(199) NOT NULL,
  `last_activity` varchar(199) NOT NULL,
  `user_data` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--


-- --------------------------------------------------------

--
-- Table structure for table `domain`
--

CREATE TABLE IF NOT EXISTS `domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `domain_name` varchar(250) NOT NULL,
  `last_scraped_time` datetime NOT NULL,
  `is_available` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `domain`
--


-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE IF NOT EXISTS `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `search_engine_url_id` int(11) NOT NULL,
  `found_email` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `email`
--


-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE IF NOT EXISTS `email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `smtp_host` varchar(100) NOT NULL,
  `smtp_port` varchar(100) NOT NULL,
  `smtp_user` varchar(100) NOT NULL,
  `smtp_password` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `email_config`
--


-- --------------------------------------------------------

--
-- Table structure for table `email_provider`
--

CREATE TABLE IF NOT EXISTS `email_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(250) NOT NULL,
  `provider_address` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `email_provider`
--

INSERT INTO `email_provider` (`id`, `provider_name`, `provider_address`) VALUES
(1, 'gmail.com', 'www.gmail.com'),
(2, 'yahoo.com', 'www.yahoo.com'),
(3, 'hotmail.com', 'hotmail.com'),
(4, 'outlook.com', 'www.outlook.com'),
(5, 'mail.com', 'www.mail.com'),
(6, 'rediff.com', 'https://mail.rediff.com'),
(7, 'yandex.com', 'https://mail.yandex.com'),
(8, 'gmx.com', 'http://www.gmx.com'),
(9, 'inbox.com', 'http://www.inbox.com'),
(10, 'fastmail.com', 'https://www.fastmail.com'),
(11, 'hushmail.com', 'https://www.hushmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `forget_password`
--

CREATE TABLE IF NOT EXISTS `forget_password` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `confirmation_code` varchar(15) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `success` int(11) NOT NULL DEFAULT '0',
  `expiration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `forget_password`
--


-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_string_replace`
--

CREATE TABLE IF NOT EXISTS `fuzzy_string_replace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `search_string` varchar(250) NOT NULL,
  `replaced_by` varchar(250) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `fuzzy_string_replace`
--

INSERT INTO `fuzzy_string_replace` (`id`, `user_id`, `search_string`, `replaced_by`, `deleted`) VALUES
(1, 1, '[at]', '@', 0),
(2, 1, ' dot ', '.', 0),
(3, 1, '[dot]', '.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `page_status`
--

CREATE TABLE IF NOT EXISTS `page_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `http_code` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total_time` varchar(50) NOT NULL,
  `namelookup_time` varchar(50) NOT NULL,
  `connect_time` varchar(50) NOT NULL,
  `speed_download` varchar(50) NOT NULL,
  `check_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `page_status`
--


-- --------------------------------------------------------

--
-- Table structure for table `payment_config`
--

CREATE TABLE IF NOT EXISTS `payment_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_email` varchar(250) NOT NULL,
  `monthly_fee` double NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `payment_config`
--

INSERT INTO `payment_config` (`id`, `paypal_email`, `monthly_fee`, `deleted`) VALUES
(3, 'mostofa.ru@gmail.com', 100, '0');

-- --------------------------------------------------------

--
-- Table structure for table `proxy`
--

CREATE TABLE IF NOT EXISTS `proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `proxy_ip` varchar(20) NOT NULL,
  `port` varchar(20) NOT NULL,
  `is_available` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `proxy`
--


-- --------------------------------------------------------

--
-- Table structure for table `search_engine_search`
--

CREATE TABLE IF NOT EXISTS `search_engine_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `search_keyword` varchar(250) NOT NULL,
  `search_in` varchar(250) NOT NULL,
  `last_scraped_time` datetime NOT NULL,
  `search_engine_name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `search_engine_search`
--


-- --------------------------------------------------------

--
-- Table structure for table `searh_engine`
--

CREATE TABLE IF NOT EXISTS `searh_engine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `search_engine_name` varchar(200) NOT NULL,
  `address` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `searh_engine`
--

INSERT INTO `searh_engine` (`id`, `search_engine_name`, `address`) VALUES
(1, 'Google', 'www.google.com'),
(2, 'Bing', 'www.bing.com');

-- --------------------------------------------------------

--
-- Table structure for table `social_network`
--

CREATE TABLE IF NOT EXISTS `social_network` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `social_network_name` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `social_network`
--

INSERT INTO `social_network` (`id`, `social_network_name`, `address`) VALUES
(1, 'facebook.com', 'www.facebook.com'),
(2, 'twitter.com', 'twitter.com'),
(3, 'linkedin.com', 'linkedin.com'),
(4, 'pinterest.com', 'pinterest.com'),
(5, 'tumblr.com', 'tumblr.com'),
(6, 'reddit.com', 'reddit.com'),
(7, 'flickr.com', 'flickr.com'),
(8, 'instagram.com', 'instagram.com');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE IF NOT EXISTS `transaction_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verify_status` varchar(200) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `paypal_email` varchar(200) NOT NULL,
  `receiver_email` varchar(200) NOT NULL,
  `country` varchar(100) NOT NULL,
  `payment_date` varchar(250) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `transaction_id` varchar(150) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cycle_start_date` date NOT NULL,
  `cycle_expired_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `transaction_history`
--


-- --------------------------------------------------------

--
-- Table structure for table `url`
--

CREATE TABLE IF NOT EXISTS `url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url_name` varchar(250) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `last_scraped_time` datetime NOT NULL,
  `is_available` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `url`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(99) NOT NULL,
  `email` varchar(99) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `password` varchar(99) NOT NULL,
  `address` text NOT NULL,
  `user_type` enum('Member','Admin') NOT NULL,
  `status` enum('1','0') NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activation_code` int(10) NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  `expired_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `password`, `address`, `user_type`, `status`, `add_date`, `activation_code`, `deleted`, `expired_date`) VALUES
(1, 'Xerone IT', 'admin@gmail.com', '+88 01729 853 6452', '259534db5d66c3effb7aa2dbbee67ab0', 'Rajshahi', 'Admin', '1', '2016-01-01 00:00:00', 0, '0', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `whois_search`
--

CREATE TABLE IF NOT EXISTS `whois_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `domain_name` varchar(250) NOT NULL,
  `owner_email` varchar(250) NOT NULL,
  `tech_email` varchar(250) NOT NULL,
  `admin_email` varchar(250) NOT NULL,
  `is_registered` varchar(50) NOT NULL,
  `namve_servers` varchar(250) NOT NULL,
  `created_at` date NOT NULL,
  `sponsor` varchar(250) NOT NULL,
  `changed_at` varchar(250) NOT NULL,
  `expire_at` varchar(250) NOT NULL,
  `scraped_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `whois_search`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
