-- MySQL Script generated by MySQL Workbench
-- 12/26/16 01:19:37
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Leanline_Database
-- -----------------------------------------------------
-- Este banco de dados irá guardar o conteúdo do aplicativo Leanline.

-- -----------------------------------------------------
-- Schema Leanline_Database
--
-- Este banco de dados irá guardar o conteúdo do aplicativo Leanline.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Leanline_Database` DEFAULT CHARACTER SET ucs2 ;
USE `Leanline_Database` ;

-- -----------------------------------------------------
-- Table `Leanline_Database`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Leanline_Database`.`USUARIO` (
  `ID_USUARIO` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(255) NOT NULL,
  `EMAIL` VARCHAR(255) NOT NULL,
  `SENHA` VARCHAR(255) NOT NULL,
  `FOTO` VARCHAR(255) NULL,
  PRIMARY KEY (`ID_USUARIO`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `Leanline_Database`.`CARDAPIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Leanline_Database`.`CARDAPIO` (
  `ID_CARDAPIO` INT NOT NULL AUTO_INCREMENT,
  `CODIGO ITEM` INT NOT NULL,
  `ITEM` VARCHAR(255) NOT NULL,
  `PREÇO` VARCHAR(255) NOT NULL,
  `ESTABELECIMENTO_ID_ESTABELECIMENTO` INT NOT NULL,
  PRIMARY KEY (`ID_CARDAPIO`, `ESTABELECIMENTO_ID_ESTABELECIMENTO`),
  INDEX `fk_CARDÁPIO_ESTABELECIMENTO1_idx` (`ESTABELECIMENTO_ID_ESTABELECIMENTO` ASC))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `Leanline_Database`.`ENDERECO_ESTABELECIMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Leanline_Database`.`ENDERECO_ESTABELECIMENTO` (
  `ID_ENDERECO_ESTABELECIMENTO` INT NOT NULL,
  `RUA` VARCHAR(255) NOT NULL,
  `NUMERO` INT NOT NULL AUTO_INCREMENT,
  `BAIRRO` VARCHAR(255) NOT NULL,
  `CIDADE` VARCHAR(255) NOT NULL,
  `ESTADO` VARCHAR(255) NOT NULL,
  `PAIS` VARCHAR(255) NOT NULL,
  `ESTABELECIMENTO_ID_ESTABELECIMENTO` INT NOT NULL,
  PRIMARY KEY (`ID_ENDERECO_ESTABELECIMENTO`, `ESTABELECIMENTO_ID_ESTABELECIMENTO`),
  INDEX `fk_ENDEREÇO_ESTABELECIMENTO_ESTABELECIMENTO1_idx` (`ESTABELECIMENTO_ID_ESTABELECIMENTO` ASC))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `Leanline_Database`.`ESTABELECIMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Leanline_Database`.`ESTABELECIMENTO` (
  `ID_ESTABELECIMENTO` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(255) NOT NULL,
  `PROMOCOES` VARCHAR(255) NOT NULL,
  `COORDENADAS_GPS` VARCHAR(255) NOT NULL,
  `CARDÁPIO_ID_CARDÁPIO` INT NOT NULL,
  `ENDEREÇO_ESTABELECIMENTO_ID_ENDEREÇO_ESTABELECIMENTO` INT NOT NULL,
  PRIMARY KEY (`ID_ESTABELECIMENTO`, `CARDÁPIO_ID_CARDÁPIO`, `ENDEREÇO_ESTABELECIMENTO_ID_ENDEREÇO_ESTABELECIMENTO`),
  INDEX `fk_ESTABELECIMENTO_CARDÁPIO_idx` (`CARDÁPIO_ID_CARDÁPIO` ASC),
  INDEX `fk_ESTABELECIMENTO_ENDEREÇO_ESTABELECIMENTO1_idx` (`ENDEREÇO_ESTABELECIMENTO_ID_ENDEREÇO_ESTABELECIMENTO` ASC))
ENGINE = MyISAM;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
