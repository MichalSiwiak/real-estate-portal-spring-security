CREATE DATABASE  IF NOT EXISTS `realestateportal`;

USE `realestateportal`;
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `enabled` boolean not null,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO `users`
VALUES
('admin','{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1,'2008-01-01 00:00:01'),
('user','{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1,'2008-01-01 00:00:01');

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `authorities`
VALUES
('user','ROLE_USER'),
('admin','ROLE_ADMIN');

DROP TABLE IF EXISTS `flat`;
CREATE TABLE `flat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` INT NOT NULL,
  `surface` INT NOT NULL,
  `rooms` INT NOT NULL,
  `city` VARCHAR(200) NOT NULL,
  `image` longblob,
  `avatar` longblob,
  `users` VARCHAR(50),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`users`) REFERENCES users(username) ON DELETE SET NULL
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;