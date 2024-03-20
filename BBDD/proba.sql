-- MySQL Script generated by MySQL Workbench
-- Mon Mar 18 13:04:58 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema erronkaDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema erronkaDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `erronkaDB` DEFAULT CHARACTER SET utf8 ;
USE `erronkaDB` ;

-- -----------------------------------------------------
-- Table `erronkaDB`.`table1`
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Table `erronkaDB`.`bezeroa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erronkaDB`.`bezeroa` (
  `NAN` CHAR(9) NOT NULL,
  `idBezeroa` INT NOT NULL,
  `izena` VARCHAR(15) NOT NULL,
  `abizena` VARCHAR(20) NOT NULL,
  `abizena2` VARCHAR(20) NOT NULL,
  `banku_zenbakia` VARCHAR(24) NULL,
  `telefonoa` CHAR(9) NOT NULL,
  PRIMARY KEY (`NAN`, `idBezeroa`),
  UNIQUE INDEX `NAN_UNIQUE` (`NAN` ASC) VISIBLE,
  UNIQUE INDEX `idBezeroa_UNIQUE` (`idBezeroa` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erronkaDB`.`erreserba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erronkaDB`.`erreserba` (
  `id_erreserba` INT NOT NULL,
  `ordua` CHAR(5) NOT NULL,
  `eguna` INT NOT NULL,
  `egoera` VARCHAR(15) NOT NULL,
  `bezeroa_idBezeroa` INT NOT NULL,
  PRIMARY KEY (`id_erreserba`, `bezeroa_idBezeroa`),
  UNIQUE INDEX `id_erreserba_UNIQUE` (`id_erreserba` ASC) VISIBLE,
  INDEX `fk_erreserba_bezeroa_idx` (`bezeroa_idBezeroa` ASC) VISIBLE,
  CONSTRAINT `fk_erreserba_bezeroa`
    FOREIGN KEY (`bezeroa_idBezeroa`)
    REFERENCES `erronkaDB`.`bezeroa` (`idBezeroa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erronkaDB`.`langilea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erronkaDB`.`langilea` (
  `NAN` INT NOT NULL,
  `izena` VARCHAR(15) NOT NULL,
  `abizena` VARCHAR(20) NOT NULL,
  `abizena2` VARCHAR(20) NOT NULL,
  `telefonoa` CHAR(9) NOT NULL,
  `banku-zenbakia` VARCHAR(24) NOT NULL,
  `lan-postua` VARCHAR(45) NOT NULL,
  `salarioa` INT NOT NULL,
  `erreserba_id_erreserba` INT NOT NULL,
  PRIMARY KEY (`NAN`, `erreserba_id_erreserba`),
  UNIQUE INDEX `NAN_UNIQUE` (`NAN` ASC) VISIBLE,
  INDEX `fk_langilea_erreserba1_idx` (`erreserba_id_erreserba` ASC) VISIBLE,
  CONSTRAINT `fk_langilea_erreserba1`
    FOREIGN KEY (`erreserba_id_erreserba`)
    REFERENCES `erronkaDB`.`erreserba` (`id_erreserba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erronkaDB`.`hornitzailea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erronkaDB`.`hornitzailea` (
  `id_hornitzailea` INT NOT NULL,
  `NIF` CHAR(9) NOT NULL,
  `izena` VARCHAR(45) NOT NULL,
  `produktua` VARCHAR(45) NOT NULL,
  `telefonoa` INT NOT NULL,
  `banku_zenbakia` VARCHAR(24) NOT NULL,
  PRIMARY KEY (`id_hornitzailea`, `NIF`),
  UNIQUE INDEX `id_hornitzailea_UNIQUE` (`id_hornitzailea` ASC) VISIBLE,
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erronkaDB`.`Produktuak`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erronkaDB`.`Produktuak` (
  `id_Produktuak` INT NOT NULL,
  `izena` VARCHAR(45) NOT NULL,
  `marka` VARCHAR(45) NOT NULL,
  `prezioa` INT NOT NULL,
  `kantitatea` INT NOT NULL,
  `deskribapena` VARCHAR(45) NULL,
  `hornitzailea_id_hornitzailea` INT NOT NULL,
  PRIMARY KEY (`id_Produktuak`, `hornitzailea_id_hornitzailea`),
  UNIQUE INDEX `id_Produktuak_UNIQUE` (`id_Produktuak` ASC) VISIBLE,
  INDEX `fk_Produktuak_hornitzailea1_idx` (`hornitzailea_id_hornitzailea` ASC) VISIBLE,
  CONSTRAINT `fk_Produktuak_hornitzailea1`
    FOREIGN KEY (`hornitzailea_id_hornitzailea`)
    REFERENCES `erronkaDB`.`hornitzailea` (`id_hornitzailea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erronkaDB`.`langilea_has_Produktuak`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erronkaDB`.`langilea_has_Produktuak` (
  `langilea_NAN` INT NOT NULL,
  `Produktuak_id_Produktuak` INT NOT NULL,
  PRIMARY KEY (`langilea_NAN`, `Produktuak_id_Produktuak`),
  INDEX `fk_langilea_has_Produktuak_Produktuak1_idx` (`Produktuak_id_Produktuak` ASC) VISIBLE,
  INDEX `fk_langilea_has_Produktuak_langilea1_idx` (`langilea_NAN` ASC) VISIBLE,
  CONSTRAINT `fk_langilea_has_Produktuak_langilea1`
    FOREIGN KEY (`langilea_NAN`)
    REFERENCES `erronkaDB`.`langilea` (`NAN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_langilea_has_Produktuak_Produktuak1`
    FOREIGN KEY (`Produktuak_id_Produktuak`)
    REFERENCES `erronkaDB`.`Produktuak` (`id_Produktuak`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;