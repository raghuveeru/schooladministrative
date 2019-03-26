-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema studentadministration
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema studentadministration
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `studentadministration` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `studentadministration` ;

-- -----------------------------------------------------
-- Table `studentadministration`.`teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studentadministration`.`teacher` ;

CREATE TABLE IF NOT EXISTS `studentadministration`.`teacher` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `is_active` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studentadministration`.`notifications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studentadministration`.`notifications` ;

CREATE TABLE IF NOT EXISTS `studentadministration`.`notifications` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` INT(11) NOT NULL,
  `notification` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `notification_teacher_id_idx` (`teacher_id` ASC) VISIBLE,
  CONSTRAINT `notification_teacher_id`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `studentadministration`.`teacher` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studentadministration`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studentadministration`.`student` ;

CREATE TABLE IF NOT EXISTS `studentadministration`.`student` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `is_suspended` TINYINT(4) NULL DEFAULT '1',
  `suspended_by` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `email`),
  INDEX `student_suspended_by_idx` (`suspended_by` ASC) VISIBLE,
  CONSTRAINT `student_suspended_by`
    FOREIGN KEY (`suspended_by`)
    REFERENCES `studentadministration`.`teacher` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studentadministration`.`studenttoteacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studentadministration`.`studenttoteacher` ;

CREATE TABLE IF NOT EXISTS `studentadministration`.`studenttoteacher` (
  `student_id` INT(11) NOT NULL,
  `teacher_id` INT(11) NOT NULL,
  INDEX `student_id_idx` (`student_id` ASC) VISIBLE,
  INDEX `teacher_id_idx` (`teacher_id` ASC) VISIBLE,
  CONSTRAINT `student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `studentadministration`.`student` (`id`),
  CONSTRAINT `teacher_id`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `studentadministration`.`teacher` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
