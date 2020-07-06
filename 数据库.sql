-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2020-07-06 18:00:09
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `qiye`
--
CREATE DATABASE IF NOT EXISTS `qiye` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `qiye`;

-- --------------------------------------------------------

--
-- 表的结构 `config`
--
-- 创建时间： 2020-07-06 09:46:51
-- 最后更新： 2020-07-06 09:46:51
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置项id',
  `key` varchar(255) NOT NULL COMMENT '配置项标识符',
  `value` text NOT NULL COMMENT '配置项值',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `m_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='配置表';

-- --------------------------------------------------------

--
-- 表的结构 `friend_link`
--
-- 创建时间： 2020-07-06 09:54:30
-- 最后更新： 2020-07-06 09:54:30
--

DROP TABLE IF EXISTS `friend_link`;
CREATE TABLE IF NOT EXISTS `friend_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '友链id',
  `name` varchar(255) NOT NULL COMMENT '友链名称/标题',
  `link` varchar(255) NOT NULL COMMENT '友链地址',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用。0-不使用，1-使用',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `m_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- --------------------------------------------------------

--
-- 表的结构 `message`
--
-- 创建时间： 2020-07-06 09:43:39
-- 最后更新： 2020-07-06 09:43:39
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `message_name` varchar(255) NOT NULL COMMENT '留言人',
  `message_content` text NOT NULL COMMENT '留言内容',
  `message_time` datetime NOT NULL COMMENT '留言时间',
  `message_ip` varchar(255) NOT NULL COMMENT '留言人ip地址',
  `reply_name` varchar(255) DEFAULT NULL COMMENT '回复人',
  `reply_content` text COMMENT '回复内容',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `reply_ip` varchar(255) DEFAULT NULL COMMENT '回复人ip地址',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `m_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言薄表';

-- --------------------------------------------------------

--
-- 表的结构 `navigation`
--
-- 创建时间： 2020-07-06 09:34:20
-- 最后更新： 2020-07-06 09:34:20
--

DROP TABLE IF EXISTS `navigation`;
CREATE TABLE IF NOT EXISTS `navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '导航项目id',
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '导航项目的父导航项目id',
  `name` varchar(255) NOT NULL COMMENT '导航项目名称',
  `icon` varchar(255) NOT NULL COMMENT '导航项目图标',
  `link` varchar(255) NOT NULL COMMENT '导航项目链接',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `m_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- --------------------------------------------------------

--
-- 表的结构 `news`
--
-- 创建时间： 2020-07-06 09:23:09
-- 最后更新： 2020-07-06 09:23:09
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻id',
  `c_id` int(11) NOT NULL COMMENT '新闻的类别id',
  `name` varchar(255) NOT NULL COMMENT '新闻名称',
  `content` text NOT NULL COMMENT '新闻内容',
  `authorr` varchar(255) DEFAULT NULL COMMENT '发布者',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '新闻状态。0-草稿，1-发布',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `m_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- --------------------------------------------------------

--
-- 表的结构 `news_category`
--
-- 创建时间： 2020-07-06 09:26:09
-- 最后更新： 2020-07-06 09:26:09
--

DROP TABLE IF EXISTS `news_category`;
CREATE TABLE IF NOT EXISTS `news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻分类id',
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类的父分类id',
  `name` varchar(255) NOT NULL COMMENT '新闻分类的父分类id',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `m_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新闻分类表';

-- --------------------------------------------------------

--
-- 表的结构 `product`
--
-- 创建时间： 2020-07-06 09:07:03
-- 最后更新： 2020-07-06 09:07:03
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `c_id` int(11) NOT NULL COMMENT '产品的类别id',
  `name` varchar(255) NOT NULL COMMENT '产品名称',
  `pic` varchar(255) NOT NULL COMMENT '产品图片',
  `description` text NOT NULL COMMENT '产品描述',
  `link` varchar(255) NOT NULL COMMENT '产品链接',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶。0-不置顶，1-置顶',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '产品状态。0-草稿，1-上架，2-下架',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `m_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品表';

-- --------------------------------------------------------

--
-- 表的结构 `product_category`
--
-- 创建时间： 2020-07-06 09:11:29
-- 最后更新： 2020-07-06 09:11:29
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品分类id',
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类的父分类id',
  `name` varchar(255) NOT NULL COMMENT '产品分类名称',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `m_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品分类表';

-- --------------------------------------------------------

--
-- 表的结构 `single_page`
--
-- 创建时间： 2020-07-06 09:51:05
-- 最后更新： 2020-07-06 09:51:05
--

DROP TABLE IF EXISTS `single_page`;
CREATE TABLE IF NOT EXISTS `single_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `title` varchar(255) NOT NULL COMMENT '页面标题',
  `content` longtext NOT NULL COMMENT '页面内容（可HTML）',
  `author` varchar(255) DEFAULT NULL COMMENT '发布者/编辑者',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `m_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单页表';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
