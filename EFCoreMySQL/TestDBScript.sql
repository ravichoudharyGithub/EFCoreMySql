-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table test.usergroups
CREATE TABLE IF NOT EXISTS `usergroups` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `CreationDateTime` datetime(6) DEFAULT NULL,
  `LastUpdateDateTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table test.usergroups: ~0 rows (approximately)
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
INSERT INTO `usergroups` (`Id`, `Name`, `CreationDateTime`, `LastUpdateDateTime`) VALUES
	(1, 'RAVI', '2018-12-05 00:00:00.000000', '2018-12-05 00:00:00.000000'),
	(2, 'RAVI2', '2018-12-05 00:00:00.000000', '2018-12-05 00:00:00.000000'),
	(3, 'RAVI3', '2018-12-05 00:00:00.000000', '2018-12-05 00:00:00.000000');
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;

-- Dumping structure for table test.users
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `UserGroupId` int(11) NOT NULL,
  `CreationDateTime` datetime(6) DEFAULT NULL,
  `LastUpdateDateTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table test.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`Id`, `FirstName`, `LastName`, `UserGroupId`, `CreationDateTime`, `LastUpdateDateTime`) VALUES
	(1, 'RAVI', 'choudhary', 1, '2018-12-05 00:00:00.000000', '2018-12-05 00:00:00.000000'),
	(2, 'RAVI2', 'choudhary', 2, '2018-12-05 00:00:00.000000', '2018-12-05 00:00:00.000000'),
	(3, 'RAVI3', 'choudhary', 3, '2018-12-05 00:00:00.000000', '2018-12-05 00:00:00.000000');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
