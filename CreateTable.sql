Create database parkmycar;

use parkmycar;


CREATE TABLE IF NOT EXISTS `ParkingLocations` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(200) NOT NULL,
  `ADDRESS` VARCHAR(200) NOT NULL,
  `CITY` VARCHAR(100) NOT NULL,
  `STATE` VARCHAR(100) NOT NULL,
  `ZIPCODE` MEDIUMINT NOT NULL,
  `CATEGORY` TINYINT NOT NULL,
  `DATEADDED` DATETIME NOT NULL,
  `DATEMODIFIED` DATETIME NOT NULL,
  `UPVOTES` INT NOT NULL DEFAULT 0,
  `DOWNVOTES` INT NOT NULL DEFAULT 0,
  `LONGITUDE` DOUBLE NOT NULL,
  `LATITUDE` DOUBLE NOT NULL,
  `ACTIVE` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`));



CREATE TABLE IF NOT EXISTS `Pricing` (
  `PARKINGLOCATIONS_ID` INT NOT NULL,
  `DAYOFWEEK` TINYINT NOT NULL,
  `HOURLYPRICE` FLOAT NOT NULL,
  `DAYPRICE` FLOAT NOT NULL,
  INDEX `fk_Pricing_ParkingLocations_idx` (`PARKINGLOCATIONS_ID` ASC),
  CONSTRAINT `fk_Pricing_ParkingLocations`
    FOREIGN KEY (`PARKINGLOCATIONS_ID`)
    REFERENCES `ParkingLocations` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




CREATE TABLE IF NOT EXISTS `UserFeedback` (
  `PARKINGLOCATIONS_ID` INT NOT NULL,
  `AVAILABILITY` TINYINT(1) NOT NULL,
  `MCDID` VARCHAR(100) NOT NULL,
  `TIMESTAMP` DATETIME NOT NULL,
  INDEX `fk_AVAILABILITY_ParkingLocations1_idx` (`PARKINGLOCATIONS_ID` ASC),
  CONSTRAINT `fk_AVAILABILITY_ParkingLocations1`
    FOREIGN KEY (`PARKINGLOCATIONS_ID`)
    REFERENCES `ParkingLocations` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);