-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rawgDatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rawgDatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rawgDatabase` DEFAULT CHARACTER SET utf8 ;
USE `rawgDatabase` ;

-- -----------------------------------------------------
-- Table `rawgDatabase`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rawgDatabase`.`games` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `metacritic` INT NULL,
  `background_image` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rawgDatabase`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rawgDatabase`.`genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `image_background` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rawgDatabase`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rawgDatabase`.`stores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `image_background` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rawgDatabase`.`games_has_stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rawgDatabase`.`games_has_stores` (
  `games_id` INT NOT NULL,
  `stores_id` INT NOT NULL,
  PRIMARY KEY (`games_id`, `stores_id`),
  INDEX `fk_games_has_stores_stores1_idx` (`stores_id` ASC) VISIBLE,
  INDEX `fk_games_has_stores_games_idx` (`games_id` ASC) VISIBLE,
  CONSTRAINT `fk_games_has_stores_games`
    FOREIGN KEY (`games_id`)
    REFERENCES `rawgDatabase`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_stores_stores1`
    FOREIGN KEY (`stores_id`)
    REFERENCES `rawgDatabase`.`stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rawgDatabase`.`games_has_genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rawgDatabase`.`games_has_genres` (
  `games_id` INT NOT NULL,
  `genres_id` INT NOT NULL,
  PRIMARY KEY (`games_id`, `genres_id`),
  INDEX `fk_games_has_genres_genres1_idx` (`genres_id` ASC) VISIBLE,
  INDEX `fk_games_has_genres_games1_idx` (`games_id` ASC) VISIBLE,
  CONSTRAINT `fk_games_has_genres_games1`
    FOREIGN KEY (`games_id`)
    REFERENCES `rawgDatabase`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_genres_genres1`
    FOREIGN KEY (`genres_id`)
    REFERENCES `rawgDatabase`.`genres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rawgDatabase`.`parent_platforms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rawgDatabase`.`parent_platforms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rawgDatabase`.`games_has_parent_platforms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rawgDatabase`.`games_has_parent_platforms` (
  `games_id` INT NOT NULL,
  `parent_platforms_id` INT NOT NULL,
  PRIMARY KEY (`games_id`, `parent_platforms_id`),
  INDEX `fk_games_has_parent_platforms_parent_platforms1_idx` (`parent_platforms_id` ASC) VISIBLE,
  INDEX `fk_games_has_parent_platforms_games1_idx` (`games_id` ASC) VISIBLE,
  CONSTRAINT `fk_games_has_parent_platforms_games1`
    FOREIGN KEY (`games_id`)
    REFERENCES `rawgDatabase`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_parent_platforms_parent_platforms1`
    FOREIGN KEY (`parent_platforms_id`)
    REFERENCES `rawgDatabase`.`parent_platforms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
