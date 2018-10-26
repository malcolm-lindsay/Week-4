-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema recipes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema recipes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `recipes` DEFAULT CHARACTER SET utf8 ;
USE `recipes` ;

-- -----------------------------------------------------
-- Table `recipes`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recipes`.`Users` (
  `UserID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NULL,
  `Surname` VARCHAR(45) NULL,
  `DietryRequirements` VARCHAR(45) NULL DEFAULT 'Null',
  `Country` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `EmailAddress` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE INDEX `RecipieID_UNIQUE` (`UserID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipes`.`Recipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recipes`.`Recipes` (
  `RecipeID` INT NOT NULL AUTO_INCREMENT,
  `RecipeType` VARCHAR(45) NULL,
  `RecipeAuthor` VARCHAR(45) NULL,
  `DietryInformation` VARCHAR(45) NULL DEFAULT 'Null',
  `EstimatedPreparationTime` INT NULL,
  `ServingSize` INT NULL,
  `Recipe_Instructions` LONGTEXT NULL,
  `Users_UserID` INT NOT NULL,
  PRIMARY KEY (`RecipeID`, `Users_UserID`),
  UNIQUE INDEX `UserID_UNIQUE` (`RecipeID` ASC),
  INDEX `fk_Recipes_Users1_idx` (`Users_UserID` ASC),
  CONSTRAINT `fk_Recipes_Users1`
    FOREIGN KEY (`Users_UserID`)
    REFERENCES `recipes`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipes`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recipes`.`Reviews` (
  `DateOfReview` INT NOT NULL,
  `Recipes_RecipeID` INT NOT NULL,
  `Users_UserID` INT NOT NULL,
  `Reviews` LONGTEXT NULL,
  PRIMARY KEY (`DateOfReview`, `Recipes_RecipeID`, `Users_UserID`),
  INDEX `fk_Reviews_Recipes1_idx` (`Recipes_RecipeID` ASC),
  INDEX `fk_Reviews_Users1_idx` (`Users_UserID` ASC),
  UNIQUE INDEX `Users_UserID_UNIQUE` (`Users_UserID` ASC),
  CONSTRAINT `fk_Reviews_Recipes1`
    FOREIGN KEY (`Recipes_RecipeID`)
    REFERENCES `recipes`.`Recipes` (`RecipeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Reviews_Users1`
    FOREIGN KEY (`Users_UserID`)
    REFERENCES `recipes`.`Users` (`UserID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
