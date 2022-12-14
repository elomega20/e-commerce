-- MySQL Script generated by MySQL Workbench
-- Tue Aug 23 15:58:38 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8 ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`clients` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `motDePass` VARCHAR(45) NOT NULL,
  `nomClient` VARCHAR(45) NOT NULL,
  `prenomClient` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`commandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`commandes` (
  `idCommande` INT NOT NULL AUTO_INCREMENT,
  `dateCommande` VARCHAR(45) NOT NULL,
  `commandeRegle` VARCHAR(45) NOT NULL DEFAULT 'non',
  `idClient` INT NOT NULL,
  PRIMARY KEY (`idCommande`, `idClient`),
  CONSTRAINT `fk_commandes_clients`
    FOREIGN KEY (`idClient`)
    REFERENCES `ecommerce`.`clients` (`idClient`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`categories` (
  `idCategorie` INT NOT NULL AUTO_INCREMENT,
  `nomCategorie` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idCategorie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`articles` (
  `idArticle` INT NOT NULL AUTO_INCREMENT,
  `designation` VARCHAR(150) NOT NULL,
  `detail` LONGTEXT NOT NULL,
  `prixUnitaire` INT NOT NULL,
  `stock` INT NOT NULL,
  `idCategorie` INT NOT NULL,
  PRIMARY KEY (`idArticle`, `idCategorie`),
  CONSTRAINT `fk_articles_categorie1`
    FOREIGN KEY (`idCategorie`)
    REFERENCES `ecommerce`.`categories` (`idCategorie`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`payements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`payements` (
  `numTelephone` VARCHAR(45) NOT NULL,
  `modePayement` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numTelephone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`livreurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`livreurs` (
  `idLivreur` INT NOT NULL AUTO_INCREMENT,
  `nomComplet` VARCHAR(45) NOT NULL,
  `numTelephone` VARCHAR(45) UNIQUE NOT NULL,
   `disponibilite` BOOLEAN NOT NULL,
  PRIMARY KEY (`idLivreur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`livraisons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`livraisons` (
  `idLivraison` INT NOT NULL AUTO_INCREMENT,
  `adressDestination` VARCHAR(100) NOT NULL,
  `livraisonEffectuer` boolean NOT NULL DEFAULT false,
  `idLivreur` INT NOT NULL,
  PRIMARY KEY (`idLivraison`, `idLivreur`),
  CONSTRAINT `fk_livraisons_livreurs1`
    FOREIGN KEY (`idLivreur`)
    REFERENCES `ecommerce`.`livreurs` (`idLivreur`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`commandes_articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`commandes_articles` (
  `idCommande` INT ,
  `idArticle` INT ,
  `quantite` INT(4),
  `prixTotal` INT,
  `payements_numTelephone` VARCHAR(45),
  `idLivraison` INT,
  PRIMARY KEY (`idCommande`, `idArticle`),
  CONSTRAINT `fk_commandes_has_articles_commandes1`
    FOREIGN KEY (`idCommande`)
    REFERENCES `ecommerce`.`commandes` (`idCommande`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_commandes_has_articles_articles1`
    FOREIGN KEY (`idArticle`)
    REFERENCES `ecommerce`.`articles` (`idArticle`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_commandes_articles_payements1`
    FOREIGN KEY (`payements_numTelephone`)
    REFERENCES `ecommerce`.`payements` (`numTelephone`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_commandes_articles_livraisons1`
    FOREIGN KEY (`idLivraison`)
    REFERENCES `ecommerce`.`livraisons` (`idLivraison`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`images` (
  `idImage` INT NOT NULL AUTO_INCREMENT,
  `urlImage` VARCHAR(100) NOT NULL,
  `idArticle` INT NOT NULL,
  PRIMARY KEY (`idImage`, `idArticle`),
  CONSTRAINT `fk_images_articles1`
    FOREIGN KEY (`idArticle`)
    REFERENCES `ecommerce`.`articles` (`idArticle`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
