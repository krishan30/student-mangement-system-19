-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jun 09, 2022 at 05:27 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_management_system-1`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcementid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` tinytext NOT NULL,
  `courseid` int(11) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `batchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`announcementid`, `title`, `body`, `courseid`, `teacherid`, `batchid`) VALUES
(3, 'Exam dates on Calculus 2022', 'Exam on Calculus 2022 will be held on 2022/06/30.', 5, 4, 3),
(4, 'Exam dates on Chemistry 2022', 'Exam on Chemistry 2022 will be held on 2022/06/25.', 2, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

CREATE TABLE `availability` (
  `availabilityid` int(11) NOT NULL,
  `availabilityname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `availability`
--

INSERT INTO `availability` (`availabilityid`, `availabilityname`) VALUES
(1, 'available'),
(2, 'unavailable');

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `batchid` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `levelid` int(11) NOT NULL,
  `starteddate` date NOT NULL,
  `endeddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batchid`, `year`, `levelid`, `starteddate`, `endeddate`) VALUES
(1, 2019, 4, '2019-01-01', NULL),
(2, 2020, 3, '2020-01-01', NULL),
(3, 2021, 2, '2021-01-01', NULL),
(4, 2022, 1, '2022-01-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseid` int(11) NOT NULL,
  `levelid` int(11) NOT NULL,
  `coursename` varchar(64) NOT NULL,
  `duration` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseid`, `levelid`, `coursename`, `duration`, `credit`, `description`) VALUES
(1, 1, 'Physics', 10, 3, 'Physics is the natural science that studies matter, its fundamental constituents, its motion and behavior through space and time, and the related entities of energy and force. Physics is one of the most fundamental scientific disciplines, with its main goal being to understand how the universe behaves.'),
(2, 1, 'Chemistry', 12, 2, 'Chemistry is the scientific study of the properties and behavior of matter. It is a natural science that covers the elements that makeup matter to the compounds composed of atoms, molecules, and ions: their composition, structure, properties, behavior, and the changes they undergo during a reaction with other substances.'),
(3, 1, 'History', 10, 3, 'History is the study and the documentation of the past. Events before the invention of writing systems are considered prehistory. \"History\" is an umbrella term comprising past events as well as the memory, discovery, collection, organization, presentation, and interpretation of these events. Historians seek knowledge of the past using historical sources such as written documents, oral accounts, art and material artifacts, and ecological markers.'),
(4, 2, 'Geometry', 12, 3, 'Geometry is, with arithmetic, one of the oldest branches of mathematics. It is concerned with space properties related to distance, shape, size, and relative position of figures. A mathematician who works in the field of geometry is called a geometer'),
(5, 2, 'Calculus', 12, 3, 'Calculus, originally called infinitesimal calculus or \"the calculus of infinitesimals\", is the mathematical study of continuous change, in the same way, that geometry is the study of shape, and algebra is the study of generalizations of arithmetic operations. '),
(6, 3, 'Literature', 12, 2, 'Literature broadly is any collection of written work, but it is also used more narrowly for writings specifically considered to be an art form, especially prose fiction, drama, and poetry. In recent centuries, the definition has expanded to include oral literature, much of which has been transcribed. Literature is a method of recording, preserving, and transmitting knowledge and entertainment, and can also have a social, psychological, spiritual, or political role. ');

-- --------------------------------------------------------

--
-- Table structure for table `courseenrollment`
--

CREATE TABLE `courseenrollment` (
  `studentid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `enrolleddate` datetime NOT NULL,
  `finisheddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courseenrollment`
--

INSERT INTO `courseenrollment` (`studentid`, `courseid`, `enrolleddate`, `finisheddate`) VALUES
(2, 3, '2022-06-07 00:00:00', NULL),
(2, 4, '2022-06-07 00:00:00', NULL),
(2, 5, '2022-06-07 00:00:00', NULL),
(2, 6, '2022-06-07 00:00:00', NULL),
(2, 2, '2022-06-07 00:00:00', NULL),
(14, 5, '2022-06-07 00:00:00', NULL),
(14, 5, '2022-06-07 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `gradeid` int(11) NOT NULL,
  `gradename` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`gradeid`, `gradename`) VALUES
(1, 'A+'),
(2, 'A'),
(3, 'A-'),
(4, 'B+'),
(5, 'B'),
(6, 'B-'),
(7, 'C+'),
(8, 'C'),
(9, 'C-'),
(10, 'W');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `levelid` int(11) NOT NULL,
  `duration` decimal(2,0) DEFAULT NULL,
  `levelname` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`levelid`, `duration`, `levelname`) VALUES
(1, '12', 'Level 1'),
(2, '12', 'Level 2'),
(3, '12', 'Level 3'),
(4, '12', 'Level 4');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `resultid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `releasedate` datetime NOT NULL,
  `batchid` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `studentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`resultid`, `courseid`, `teacherid`, `releasedate`, `batchid`, `grade`, `studentid`) VALUES
(1, 2, 3, '2022-06-07 16:59:41', 3, 1, 14),
(2, 5, 4, '2022-06-07 16:59:41', 3, 3, 14);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentid` int(11) NOT NULL,
  `batchid` int(11) NOT NULL,
  `userid` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentid`, `batchid`, `userid`) VALUES
(2, 1, '100003R'),
(3, 3, '100004G'),
(4, 3, '100005J'),
(5, 3, '100006G'),
(6, 1, '100007A'),
(7, 2, '100008Y'),
(8, 4, '100009U'),
(9, 2, '100010O'),
(10, 3, '100011F'),
(11, 2, '100012G'),
(12, 2, '100013F'),
(13, 1, '100015P'),
(14, 4, '100017L'),
(15, 2, '100020F');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacherid` int(11) NOT NULL,
  `userid` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherid`, `userid`) VALUES
(2, '100014W'),
(3, '100018Y'),
(4, '100019V');

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `courseid` int(11) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `availabilityid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`courseid`, `teacherid`, `availabilityid`) VALUES
(2, 2, 1),
(2, 3, 1),
(5, 4, 1),
(6, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `timetableid` int(11) NOT NULL,
  `releasedate` datetime NOT NULL,
  `timetable` blob NOT NULL,
  `batchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` varchar(16) NOT NULL,
  `usertypeid` int(11) NOT NULL,
  `firstname` varchar(60) DEFAULT NULL,
  `lastname` varchar(60) DEFAULT NULL,
  `contactnumber` char(10) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `nic` varchar(16) DEFAULT NULL,
  `registrationdate` datetime DEFAULT NULL,
  `leavedate` datetime DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `usertypeid`, `firstname`, `lastname`, `contactnumber`, `address`, `nic`, `registrationdate`, `leavedate`, `email`, `password`) VALUES
('100000A', 3, 'Admin', 'Admin', '0700000000', 'SL', 'xxxxxxxxxxxxxx', NULL, NULL, 'admin@gmail.com', '$2b$10$docCZjHNPFDJQZswFVcvqebNkpWFtOfZUcEeUp2pyGw4mAn.cUQL2'),
('100003R', 1, 'Abinesh', 'Thaventhirarajah', '0771886977', 'No 212, hospital road, Manthikai', '987612355V', '2022-06-06 00:00:00', NULL, 'a@gmail.com', '$2b$10$gMVlSUDWn67iaAgyhfMAb.pqVFF1Lty6Lwan6yV/7EvUspJvVXQQ2'),
('100004G', 1, 'Kamal', 'Perera', '0777777123', 'Alavi East, Alvai', '996663877V', '2022-06-06 00:00:00', NULL, 'kamal12@gmail.com', '$2b$10$czL5oJ87zSF9FHJRmc2vDu6JZ0zyhaWBkzcodbz5./ZIEEVbdFHQe'),
('100005J', 1, 'Nimal', 'Fernando', '0775647777', '72 Tarkiln Hill St.\nNewtown, PA 18940', '200000301521', '2022-06-06 00:00:00', NULL, 'nimalf@gmail.com', '$2b$10$BekhLvWhMGx29RfhnIPHSOK6qIwbgm6rEwBu69SK2kKmHVJ6FnxVO'),
('100006G', 1, 'Robert ', 'Patricia', '0713777771', '941 North Lexington Road\nTorrance, CA 90505', '200000301521', '2022-06-06 00:00:00', NULL, 'robert@gmail.com', '$2b$10$Eb86jR8Cvi/kyXzln.MNDe3H7L3onVrE9JEdc/CaiBhxKWwjdBrvC'),
('100007A', 1, 'Abinesh', 'Janson ', '0751231333', 'No 55, hospital road, Manthikai', '996688177V', '2022-06-06 00:00:00', NULL, 'aj@gmail.com', '$2b$10$KRWmBWG.3HnpsIglJgA0Ue7u89id23WJGEWk7UKMO0Imc/a1nUJgW'),
('100008Y', 1, 'John', 'Jennifer', '0771487788', '769 Joy Ridge St.\nBlackwood, NJ 08012', '987718177V', '2022-06-06 00:00:00', NULL, 'johnj@gmail.com', '$2b$10$aC59NbOrGwS5jpEqbLct0uEZGKcwxb9RTwZd8m2Iy84Db7YKK3FlG'),
('100009U', 1, 'Kulendran', 'indu', '0777645771', 'No 20, Navindil,Udupiddy', '200000344555', '2022-06-06 00:00:00', NULL, 'kulendrani@gmail.com', '$2b$10$0AlFDzLHCcY0Dz7Jb0.No.PifOier1.8d7RuyvR1zV/sdb4TnWx5a'),
('100010O', 1, 'William', 'Barbara', '0112777777', 'Alavi East, Alvai', '200100344886', '2022-06-06 00:00:00', NULL, 'william@gmail.com', '$2b$10$NQjcmo5i4NczBnPhR2apbu9lvT8sVeczyhcqPHyS/GG8jy9w75s32'),
('100011F', 1, 'Micheal', 'Linda', '0119877877', '486 Golden Star Ave.\nVineland, NJ 08360', '200285678888', '2022-06-06 00:00:00', NULL, 'michaell@gmail.com', '$2b$10$NwsItR5IbUkEKen92ybGqegw9x4V2KyhXWNO46ryolFIxfqxZui.y'),
('100012G', 1, 'David', 'Ellixabath', '0778497771', '7777 St Margarets Rd.\nMetairie, LA 70001', '200164448669', '2022-06-06 00:00:00', NULL, 'david@gmail.com', '$2b$10$p4njm4ZIdpIUL6F5S5yrVOLwEZ24uVPPmQbK0gs/9XUGWUU.VMn62'),
('100013F', 1, 'Richard', 'Susan', '0717776687', 'Alvai East Alvai Point Pedro, Sri Lanka', '200164538678', '2022-06-06 00:00:00', NULL, 'richards@gmail.com', '$2b$10$AUPLhiKL4tmenBdE6jhwdOEaR2/vvIM8LiS2/6taIAzHKkihmtrOS'),
('100014W', 2, 'Thomas', 'Sarah', '0771122321', 'no 227, near udupiddy amc, udupiddy', '200064225669', '2022-06-06 00:00:00', NULL, 'thomass@gmail.com', '$2b$10$K4RFkpRFdL0awCQ860/O/.6wHaXVyNzTjz9xzC91tIhbS6YGuXeJG'),
('100015P', 1, 'Charles', 'Karen', '0746588777', '159 Ramblewood Rd.\nAnchorage, AK 99504', '200055125668', '2022-06-06 00:00:00', NULL, 'charlesk@gmail.com', '$2b$10$/RdYbM0ydyjVu.XIC/AMiOgdqnqVaEAt5p8KlmJvlqbx9C8Y1A2fS'),
('100017L', 1, 'Joseph', 'Janson', '0712577755', '9 Applegate Street\nTullahoma, TN 37388', '200054389698', '2022-06-06 00:00:00', NULL, 'josephj@gmail.com', '$2b$10$/WIfU59et087AZOXDWltUejMUR1Ga132be6qdbjDsAQIdsRvfpGJq'),
('100018Y', 2, 'Kumar', 'Depp', '0771231234', 'no 227, near udupiddy amc, udupiddy', '200000323234', '2022-06-07 00:00:00', NULL, 'kumar@gmail.com', '$2b$10$L.jpU0wtqVrhMmusnO0jmeofuRw13VsC/GYd5YSFmho4AN1lZy2tW'),
('100019V', 2, 'Akila', 'Perera', '0771231234', '268 North Pacific Street\nWesterville, OH 43081', '200054378991', '2022-06-07 00:00:00', NULL, 'akilap@gmail.com', '$2b$10$fxRddrQ87.nGTIOTZFkv4uDekPiPfS5EOy0dSRen.usPgN.gzmqsW'),
('100020F', 1, 'Supun', 'Parakrama', '071812123', '104/12 adnewas road perriyamulla negombo', '99876123V', '2022-06-08 00:00:00', NULL, 'supunp@uom.ac.lk', '$2b$10$eFPL0SeRpomP93rUpqUfIuaFAf5vj9bnhxY79IrICg9YBexC6trhK');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `usertypeid` int(11) NOT NULL,
  `usertypename` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`usertypeid`, `usertypename`) VALUES
(1, 'Student'),
(2, 'Teacher'),
(3, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcementid`),
  ADD KEY `courseid` (`courseid`),
  ADD KEY `teacherid` (`teacherid`),
  ADD KEY `batchid` (`batchid`);

--
-- Indexes for table `availability`
--
ALTER TABLE `availability`
  ADD PRIMARY KEY (`availabilityid`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batchid`),
  ADD KEY `levelid` (`levelid`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseid`);

--
-- Indexes for table `courseenrollment`
--
ALTER TABLE `courseenrollment`
  ADD KEY `studentid` (`studentid`),
  ADD KEY `courseid` (`courseid`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`gradeid`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`levelid`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`resultid`),
  ADD KEY `courseid` (`courseid`),
  ADD KEY `teacherid` (`teacherid`),
  ADD KEY `batchid` (`batchid`),
  ADD KEY `grade` (`grade`),
  ADD KEY `studentid` (`studentid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentid`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD KEY `courseid` (`courseid`),
  ADD KEY `teacherid` (`teacherid`),
  ADD KEY `availabilityid` (`availabilityid`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`timetableid`),
  ADD KEY `batchid` (`batchid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `usertypeid` (`usertypeid`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`usertypeid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcementid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `availability`
--
ALTER TABLE `availability`
  MODIFY `availabilityid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `batchid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `gradeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `levelid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `resultid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacherid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `timetableid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `usertypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  ADD CONSTRAINT `announcement_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`),
  ADD CONSTRAINT `announcement_ibfk_3` FOREIGN KEY (`batchid`) REFERENCES `batch` (`batchid`);

--
-- Constraints for table `batch`
--
ALTER TABLE `batch`
  ADD CONSTRAINT `batch_ibfk_1` FOREIGN KEY (`levelid`) REFERENCES `level` (`levelid`);

--
-- Constraints for table `courseenrollment`
--
ALTER TABLE `courseenrollment`
  ADD CONSTRAINT `courseenrollment_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`),
  ADD CONSTRAINT `courseenrollment_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`),
  ADD CONSTRAINT `result_ibfk_3` FOREIGN KEY (`batchid`) REFERENCES `batch` (`batchid`),
  ADD CONSTRAINT `result_ibfk_4` FOREIGN KEY (`grade`) REFERENCES `grade` (`gradeid`),
  ADD CONSTRAINT `result_ibfk_5` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`),
  ADD CONSTRAINT `teaches_ibfk_3` FOREIGN KEY (`availabilityid`) REFERENCES `availability` (`availabilityid`);

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`batchid`) REFERENCES `batch` (`batchid`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`usertypeid`) REFERENCES `usertype` (`usertypeid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
