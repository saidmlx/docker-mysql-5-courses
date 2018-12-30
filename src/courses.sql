
--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id_teacher` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  PRIMARY KEY (`id_teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id_social_media` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_social_media`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id_course` int(11) NOT NULL AUTO_INCREMENT,
  `id_teacher` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `themes` text,
  `project` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_course`),
  KEY `fk_c_teacher` (`id_teacher`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `teacher` (`id_teacher`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


--
-- Table structure for table `teacher_social_media`
--

CREATE TABLE `teacher_social_media` (
  `id_teacher_social_media` int(11) NOT NULL AUTO_INCREMENT,
  `id_teacher` int(11) NOT NULL,
  `id_social_media` int(11) NOT NULL,
  `nickname` varchar(250) NOT NULL,
  PRIMARY KEY (`id_teacher_social_media`),
  KEY `fk_tsm_teacher` (`id_teacher`,`id_social_media`),
  KEY `fk_tsm_social_media` (`id_social_media`),
  CONSTRAINT `teacher_social_media_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `teacher` (`id_teacher`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `teacher_social_media_ibfk_2` FOREIGN KEY (`id_social_media`) REFERENCES `social_media` (`id_social_media`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` VALUES (1,'Said Morales','saidmlx');

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` VALUES (1,'twiter','twiter'),(2,'facebook','facebook');

--
-- Dumping data for table `teacher_social_media`
--

INSERT INTO `teacher_social_media` VALUES (1,1,1,'@saidmlx');

--
-- Dumping data for table `course`
--
INSERT INTO `course` VALUES (1,1,'Java JEE','Java, Servers, Spring framework','REST API'),(2,1,'Java SE','Java, POO','JAR generation');


