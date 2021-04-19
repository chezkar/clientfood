-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cv
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cv` ;

-- -----------------------------------------------------
-- Schema cv
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cv` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cv` ;

-- -----------------------------------------------------
-- Table `cv`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cv`.`Category` ;

CREATE TABLE IF NOT EXISTS `cv`.`Category` (
  `idCategory` INT NOT NULL AUTO_INCREMENT,
  `CategoryName` VARCHAR(45) NOT NULL,
  `CategoryDescription` TEXT NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cv`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cv`.`Product` ;

CREATE TABLE IF NOT EXISTS `cv`.`Product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `ProductPrice` FLOAT NOT NULL,
  `Category_idCategory` INT NOT NULL,
  PRIMARY KEY (`idProduct`),
  INDEX `fk_Product_Category1_idx` (`Category_idCategory` ASC) VISIBLE,
  CONSTRAINT `fk_Product_Category1`
    FOREIGN KEY (`Category_idCategory`)
    REFERENCES `cv`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cv`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cv`.`Client` ;

CREATE TABLE IF NOT EXISTS `cv`.`Client` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `ClientNIT` VARCHAR(12) NOT NULL,
  `ClientName` VARCHAR(100) NOT NULL,
  `ClientLastname` VARCHAR(100) NOT NULL,
  `ClientPhone` INT NULL,
  `ClientAddress` TEXT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE INDEX `ClientNIT_UNIQUE` (`ClientNIT` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cv`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cv`.`Order` ;

CREATE TABLE IF NOT EXISTS `cv`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  PRIMARY KEY (`idOrder`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cv`.`OrderDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cv`.`OrderDetails` ;

CREATE TABLE IF NOT EXISTS `cv`.`OrderDetails` (
  `idOrderDetails` INT NOT NULL AUTO_INCREMENT,
  `Quantity` INT NOT NULL,
  `Order_idOrder` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `Client_idClient` INT NOT NULL,
  PRIMARY KEY (`idOrderDetails`),
  INDEX `fk_OrderDetails_Order_idx` (`Order_idOrder` ASC) VISIBLE,
  INDEX `fk_OrderDetails_Product1_idx` (`Product_idProduct` ASC) VISIBLE,
  INDEX `fk_OrderDetails_Client1_idx` (`Client_idClient` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDetails_Order`
    FOREIGN KEY (`Order_idOrder`)
    REFERENCES `cv`.`Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetails_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `cv`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetails_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `cv`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cv`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cv`.`Users` ;

CREATE TABLE IF NOT EXISTS `cv`.`Users` (
  `idUsers` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsers`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
