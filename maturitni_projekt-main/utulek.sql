-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`mesto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`mesto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`mesto` (
  `idmesto` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  `kraj` VARCHAR(45) NOT NULL,
  `psc` INT NOT NULL,
  INDEX `kraj` (`kraj` ASC),
  INDEX `psc` (`psc` ASC),
  INDEX `nazev` (`nazev` ASC),
  PRIMARY KEY (`idmesto`, `nazev`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`utulek`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`utulek` ;

CREATE TABLE IF NOT EXISTS `mydb`.`utulek` (
  `idutulek` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  `adresa` VARCHAR(45) NOT NULL,
  `mesto_nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idutulek`, `nazev`),
  UNIQUE INDEX `nazev` (`nazev` ASC),
  INDEX `adresa` (`adresa` ASC),
  INDEX `fk_utulek_mesto1_idx` (`mesto_nazev` ASC),
  CONSTRAINT `fk_utulek_mesto1`
    FOREIGN KEY (`mesto_nazev`)
    REFERENCES `mydb`.`mesto` (`nazev`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`osetrovatel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`osetrovatel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`osetrovatel` (
  `idosetrovatel` INT NOT NULL AUTO_INCREMENT,
  `jmeno` VARCHAR(45) NOT NULL,
  `prijmeni` VARCHAR(45) NOT NULL,
  `mobil` INT NOT NULL,
  `utulek_nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idosetrovatel`),
  INDEX `prijmeni_UNIQUE` (`prijmeni` ASC),
  INDEX `jmeno` (`jmeno` ASC),
  INDEX `mobil` (`mobil` ASC),
  INDEX `fk_osetrovatel_utulek1_idx` (`utulek_nazev` ASC),
  CONSTRAINT `fk_osetrovatel_utulek1`
    FOREIGN KEY (`utulek_nazev`)
    REFERENCES `mydb`.`utulek` (`nazev`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pes` (
  `idpes` INT NOT NULL AUTO_INCREMENT,
  `ockovani` ENUM('Ano', 'Ne') NULL,
  `jmeno` VARCHAR(45) NOT NULL,
  `rasa` VARCHAR(45) NULL,
  `vek` ENUM('2 - 6 měs', '6 měs - 2 roky', '2 - 8 let', '8 a více') NULL,
  `velikost` SET('maly', 'stredni', 'velky') NULL,
  `stav` SET('kastrovany', 'handicapovany', 'akutni adoptce') NULL,
  `pohlavi` ENUM('Pes', 'Fena') NULL,
  `popis` LONGTEXT NULL,
  `fotografie` LONGBLOB NULL,
  `utulek_nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpes`),
  INDEX `jmeno` (`jmeno` ASC),
  INDEX `rasa` (`rasa` ASC),
  INDEX `vek` (`vek` ASC),
  INDEX `velikost` (`velikost` ASC),
  INDEX `stav` (`stav` ASC),
  INDEX `ockovani` (`ockovani` ASC),
  INDEX `pohlavi` (`pohlavi` ASC),
  INDEX `popis` (`popis` ASC),
  INDEX `fk_pes_utulek1_idx` (`utulek_nazev` ASC),
  CONSTRAINT `fk_pes_utulek1`
    FOREIGN KEY (`utulek_nazev`)
    REFERENCES `mydb`.`utulek` (`nazev`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`navsteva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`navsteva` ;

CREATE TABLE IF NOT EXISTS `mydb`.`navsteva` (
  `idnavsteva` INT NOT NULL AUTO_INCREMENT,
  `jmeno` VARCHAR(45) NOT NULL,
  `prijmeni` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `mobil` INT NULL,
  `datum` DATETIME(4) NOT NULL,
  `utulek_nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idnavsteva`, `email`),
  UNIQUE INDEX `idnavsteva_UNIQUE` (`idnavsteva` ASC),
  INDEX `jmeno` (`jmeno` ASC),
  INDEX `prijmeni` (`prijmeni` ASC),
  INDEX `mobil` (`mobil` ASC),
  INDEX `datum` (`datum` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_navsteva_utulek1_idx` (`utulek_nazev` ASC),
  CONSTRAINT `fk_navsteva_utulek1`
    FOREIGN KEY (`utulek_nazev`)
    REFERENCES `mydb`.`utulek` (`nazev`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`zajemce`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`zajemce` ;

CREATE TABLE IF NOT EXISTS `mydb`.`zajemce` (
  `idzajemce` INT NOT NULL AUTO_INCREMENT,
  `jmeno` VARCHAR(45) NOT NULL,
  `prijmeni` VARCHAR(45) NOT NULL,
  `mobil` INT(9) NULL,
  `email` VARCHAR(45) NOT NULL,
  `mesto_nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idzajemce`, `email`),
  UNIQUE INDEX `idzajemce_UNIQUE` (`idzajemce` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `jmeno` (`jmeno` ASC),
  INDEX `prijmeni` (`prijmeni` ASC),
  INDEX `mobil` (`mobil` ASC),
  INDEX `fk_zajemce_mesto1_idx` (`mesto_nazev` ASC),
  CONSTRAINT `fk_zajemce_mesto1`
    FOREIGN KEY (`mesto_nazev`)
    REFERENCES `mydb`.`mesto` (`nazev`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pes_has_zajemce`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pes_has_zajemce` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pes_has_zajemce` (
  `zajemce_idzajemce` INT NOT NULL,
  `zajemce_email` VARCHAR(45) NOT NULL,
  `pes_idpes` INT NOT NULL,
  `pes_utulek_nazev` VARCHAR(45) NOT NULL,
  `pes_utulek_mesto_nazev` VARCHAR(50) NOT NULL,
  INDEX `fk_pes_has_zajemce_zajemce1_idx` (`zajemce_idzajemce` ASC, `zajemce_email` ASC),
  INDEX `fk_pes_has_zajemce_pes1_idx` (`pes_idpes` ASC, `pes_utulek_nazev` ASC, `pes_utulek_mesto_nazev` ASC),
  CONSTRAINT `fk_pes_has_zajemce_zajemce1`
    FOREIGN KEY (`zajemce_idzajemce` , `zajemce_email`)
    REFERENCES `mydb`.`zajemce` (`idzajemce` , `email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pes_has_zajemce_pes1`
    FOREIGN KEY (`pes_idpes`)
    REFERENCES `mydb`.`pes` (`idpes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
