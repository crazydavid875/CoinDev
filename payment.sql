-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： db:3306
-- 產生時間： 2021 年 08 月 30 日 19:59
-- 伺服器版本： 8.0.25
-- PHP 版本： 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `payment`
--

-- --------------------------------------------------------

--
-- 資料表結構 `article`
--

CREATE TABLE `article` (
  `id` int NOT NULL,
  `title` varchar(1000) NOT NULL,
  `auth` varchar(500) NOT NULL,
  `uid` int NOT NULL,
  `rid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `article`
--

INSERT INTO `article` (`id`, `title`, `auth`, `uid`, `rid`) VALUES
(4, 'accssssq', 'www', 87, NULL),
(5, '', '', 100, 11),
(6, 'ww', 'ss', 100, NULL),
(7, 'test', 'aa', 103, 12),
(8, '', '', 104, NULL),
(9, 'wd', 's', 104, NULL),
(10, '', '', 104, NULL),
(11, 'wd', 'a', 104, NULL),
(12, '', '', 104, NULL),
(13, '', '', 105, 14),
(14, 'q', 'f', 106, 15),
(15, '', '', 121, 17),
(16, '', '', 121, NULL),
(17, '', '', 122, 18),
(18, '', '', 123, 19),
(19, '', '', 124, 20),
(20, '', '', 124, NULL),
(21, 'bb', 'aa', 127, NULL),
(22, '', '', 125, 21),
(23, 'accssssqwww', 'www', 87, NULL),
(24, 'aa', 'bb', 50, NULL),
(25, 'cc', 'dd', 91, NULL),
(26, 'aa', 'cc', 87, NULL),
(27, 'aa', 'cc', 87, NULL),
(28, 'aa', 'cc', 87, NULL),
(29, '', '', 130, NULL),
(33, '33', 'ww', 131, NULL),
(34, 'qq', 'ss', 131, NULL),
(35, 'ww', 'ee', 131, NULL),
(36, 'xx', 'ff', 131, NULL),
(37, 'qq', 'aa', 132, NULL),
(38, 'bb', 'cc', 132, NULL),
(39, 'ddd', 'eee', 132, NULL),
(40, 'ss', 'vv', 133, NULL),
(41, 'ff', 'tt', 133, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `paymentrecord`
--

CREATE TABLE `paymentrecord` (
  `id` int NOT NULL,
  `ispay` tinyint(1) NOT NULL DEFAULT '-1',
  `pid` int NOT NULL,
  `timestamp` int NOT NULL,
  `uid` int NOT NULL,
  `amt` int NOT NULL,
  `content` varchar(1000) NOT NULL,
  `articleCount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `paymentrecord`
--

INSERT INTO `paymentrecord` (`id`, `ispay`, `pid`, `timestamp`, `uid`, `amt`, `content`, `articleCount`) VALUES
(9, 1, 1, 1629837060, 4, 250, '', 0),
(11, 1, 2, 1629890948, 100, 300, '', 1),
(12, -1, 2, 1629892121, 103, 300, '', 0),
(14, -1, 2, 1629894889, 105, 300, '', 0),
(15, -1, 2, 1629894958, 106, 300, '', 0),
(16, -1, 1, 1629899939, 107, 250, '', 0),
(17, -1, 2, 1629903285, 121, 300, '', 0),
(18, -1, 2, 1629903309, 122, 300, '', 0),
(19, -1, 2, 1629903466, 123, 300, '', 0),
(20, -1, 2, 1629903618, 124, 300, '', 0),
(21, -1, 2, 1629903789, 125, 300, '', 0),
(22, -1, 1, 1629903965, 126, 250, '', 0),
(23, -1, 1, 1629965800, 127, 250, '', 0),
(24, -1, 1, 1629966346, 128, 250, '', 0),
(30, -1, 2, 1630233920, 87, 600, '2篇論文', 2),
(32, -1, 2, 1630305361, 130, 300, '1篇論文', 1),
(36, -1, 2, 1630305571, 131, 600, '2篇論文', 2),
(38, -1, 2, 1630308558, 132, 900, '3篇論文', 3),
(39, -1, 1, 1630310738, 133, 250, '沒有論文', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `paymode`
--

CREATE TABLE `paymode` (
  `id` int NOT NULL,
  `name` varchar(500) NOT NULL,
  `amt` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `paymode`
--

INSERT INTO `paymode` (`id`, `name`, `amt`) VALUES
(1, '沒有論文', 250),
(2, '有論文', 300);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(256) NOT NULL,
  `isVerify` tinyint(1) NOT NULL DEFAULT '0',
  `permit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`id`, `pwd`, `name`, `email`, `isVerify`, `permit`) VALUES
(1, 'a', 'bb', 'aacc@ntut', -1, 0),
(4, 'a', 'bb', 'aaccaaa@ntut', -1, 0),
(6, 'a', 'bb', 'aaccaaaeee@ntut', -1, 0),
(50, 'a', 'bb', 'aaccaaaeee@ntutwww', -1, 0),
(52, 'a', 'bb', 'aaccaaaeee@ntuwwwtwww', -1, 0),
(85, 'a', 'bb', 'aaccaaaeee@aaantuwwwtwww', -1, 0),
(87, 'a', 'dd', 'ddd', -1, 0),
(89, 'a', 'bb', 'aaccaaaeewwwe@wwwaaantuwwwtwww', -1, 0),
(90, 'a', 'bb', 'aaccaaaeewwwwwe@wwwaaantuwwwtwww', -1, 0),
(91, 'a', 'bb', 'aaccaaaaaaeewwwwwe@wwwaaantuwwwtwww', -1, 0),
(93, 'a', 'bb', 'aaccaaaaaaeewwwwwe@wwwwwaaantuwwwtwww', -1, 0),
(94, '112', 'ww', 'ss', -1, 0),
(96, 'cc', 'aa', 'bb', -1, 0),
(97, 'xd', 'ww', 'vv', -1, 0),
(98, 'ww', 'www', 'ee', -1, 0),
(99, 'ssdsa', 'ww', 'aa@gmail.com', -1, 0),
(100, 'we', 'fwefw', 'ergegre', -1, 0),
(101, 'wd', 'qq', 'wwd', -1, 0),
(103, 'abc', '劉奕欣', 'aabbcc@gmail.com', -1, 0),
(104, 'dadsw', 'sd', 'abcderswdf@ntut.org.tw', -1, 0),
(105, 'we', 'wef', 'dsf@gg.ss', -1, 0),
(106, 'we', 'wer', 'wreewf', -1, 0),
(107, '', '', 'wd', -1, 0),
(112, '', 'wd', 'e', -1, 0),
(115, '', 'wd', 'w', -1, 0),
(118, 'wRDKRr7DQkxpZLm', '', 'wdawdwa', -1, 0),
(120, 'wRDKRr7DQkxpZLm', '', 'wadwdwd!', -1, 0),
(121, 'wRDKRr7DQkxpZLm', 'wada', 'aaaw@aaa.cd', -1, 0),
(122, 'wRDKRr7DQkxpZLm', 'wqdqwd', 'wdqwd@dfwfwfwkfpowefw.cc', -1, 0),
(123, 'wRDKRr7DQkxpZLm', 'swfw', 'ad@wfwf.wfwwef', -1, 0),
(124, 'wRDKRr7DQkxpZLm', 'wefwe', 'ewfwef@.wef.qwr', -1, 0),
(125, 'wRDKRr7DQkxpZLm', 'ewf', 'wef@we.wwef.wef', -1, 0),
(126, 'wRDKRr7DQkxpZLm', 'wqdqwd', 'qwdqwd@wewf.wefw.ewf', -1, 0),
(127, '111111111111', 'aa', 't107590009@ntut.edu.tw', -1, 0),
(128, '2222222222222222', 'ee', 'divd69@yahoo.com.tw', -1, 0),
(129, 'wq11111111111111', 'aa', 'efsfsfsfsfse@fewfw.tttt', -1, 0),
(130, '111111111111', 'wdwdw', 'aaa@aaa.aaa.aaa', -1, 0),
(131, '111111111111', 'wwwweewww', 'eeeeee@eee.eee', -1, 0),
(132, '111111111111', 'bb', 'b@b.b', -1, 0),
(133, '111111111111', 'ss', 'ss@gmail.com', -1, 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uidx` (`uid`),
  ADD KEY `ridx` (`rid`);

--
-- 資料表索引 `paymentrecord`
--
ALTER TABLE `paymentrecord`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pidx` (`pid`),
  ADD KEY `uidxx` (`uid`);

--
-- 資料表索引 `paymode`
--
ALTER TABLE `paymode`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `article`
--
ALTER TABLE `article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `paymentrecord`
--
ALTER TABLE `paymentrecord`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `paymode`
--
ALTER TABLE `paymode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `ridx` FOREIGN KEY (`rid`) REFERENCES `paymentrecord` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `uidx` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 資料表的限制式 `paymentrecord`
--
ALTER TABLE `paymentrecord`
  ADD CONSTRAINT `pidx` FOREIGN KEY (`pid`) REFERENCES `paymode` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `uidxx` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
