CREATE SCHEMA `sample03db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE TABLE `sample03db`.`test` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
INSERT INTO `sample03db`.`test` VALUES (null, 'Hello Vadart!');