-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema olxresale
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema olxresale
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `olxresale` DEFAULT CHARACTER SET latin1 ;
USE `olxresale` ;

-- -----------------------------------------------------
-- Table `olxresale`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olxresale`.`address` (
  `addressid` INT(20) NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `sublocation` VARCHAR(20) NULL DEFAULT NULL,
  `state` VARCHAR(20) NULL DEFAULT NULL,
  `pincode` VARCHAR(20) NULL DEFAULT NULL,
  `country` VARCHAR(20) NULL DEFAULT NULL,
  `street` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`addressid`))
ENGINE = InnoDB
AUTO_INCREMENT = 57
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `olxresale`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olxresale`.`user` (
  `firstname` VARCHAR(20) NULL DEFAULT NULL,
  `lastname` VARCHAR(20) NULL DEFAULT NULL,
  `age` INT(20) NULL DEFAULT NULL,
  `gender` VARCHAR(20) NULL DEFAULT NULL,
  `contactnumber` VARCHAR(20) NULL DEFAULT NULL,
  `userid` INT(20) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `addressid` INT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE INDEX `email` (`email` ASC),
  INDEX `addressid` (`addressid` ASC),
  CONSTRAINT `user_ibfk_1`
    FOREIGN KEY (`addressid`)
    REFERENCES `olxresale`.`address` (`addressid`))
ENGINE = InnoDB
AUTO_INCREMENT = 34
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `olxresale`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olxresale`.`category` (
  `categoryid` INT(20) NOT NULL,
  `categoryname` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`categoryid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `olxresale`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olxresale`.`item` (
  `itemname` VARCHAR(255) NULL DEFAULT NULL,
  `categoryid` INT(25) NULL DEFAULT NULL,
  `price` DOUBLE NULL DEFAULT NULL,
  `yearsofusage` INT(25) NULL DEFAULT NULL,
  `itemid` INT(25) NOT NULL DEFAULT '0',
  `itemimage` MEDIUMBLOB NULL DEFAULT NULL,
  `userid` INT(25) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `quantity` INT(25) NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  INDEX `userid` (`userid` ASC),
  INDEX `categoryid` (`categoryid` ASC),
  CONSTRAINT `item_ibfk_1`
    FOREIGN KEY (`userid`)
    REFERENCES `olxresale`.`user` (`userid`),
  CONSTRAINT `item_ibfk_2`
    FOREIGN KEY (`categoryid`)
    REFERENCES `olxresale`.`category` (`categoryid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `olxresale`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olxresale`.`cart` (
  `userid` INT(20) NULL DEFAULT NULL,
  `itemid` INT(25) NULL DEFAULT NULL,
  INDEX `userid` (`userid` ASC),
  INDEX `itemid` (`itemid` ASC),
  CONSTRAINT `cart_ibfk_1`
    FOREIGN KEY (`userid`)
    REFERENCES `olxresale`.`user` (`userid`),
  CONSTRAINT `cart_ibfk_2`
    FOREIGN KEY (`itemid`)
    REFERENCES `olxresale`.`item` (`itemid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
