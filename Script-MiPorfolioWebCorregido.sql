-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolioWeb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolioWeb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolioWeb` DEFAULT CHARACTER SET utf8 ;
USE `portfolioWeb` ;

-- -----------------------------------------------------
-- Table `portfolioWeb`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`persona` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `domicilio` VARCHAR(45) NULL,
  `fechaNac` DATE NULL,
  `telefono` VARCHAR(12) NULL,
  `correo` VARCHAR(45) NULL,
  `sobreMi` VARCHAR(45) NULL,
  `url_img` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`tipo_empleo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`tipo_empleo` (
  `id` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`experiencia_laboral` (
  `id` INT NOT NULL,
  `nombreEmpresa` VARCHAR(45) NULL,
  `esTrabajoActual` TINYINT NULL,
  `fechaInicio` DATE NULL,
  `fechaFin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `url_imagen` VARCHAR(100) NULL,
  `persona_id` INT NOT NULL,
  `tipo_empleo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  
  CONSTRAINT `fk_experiencia_laboral_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolioWeb`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_laboral_tipo_empleo1`
    FOREIGN KEY (`tipo_empleo_id`)
    REFERENCES `portfolioWeb`.`tipo_empleo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`educacion` (
  `id` INT NOT NULL,
  `materia` VARCHAR(45) NULL,
  `fechaInicio` DATE NULL,
  `fechaFin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  
  CONSTRAINT `fk_educacion_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolioWeb`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`tipo_habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`tipo_habilidad` (
  `id` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`habilidades` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `porcentaje` INT NULL,
  `persona_id` INT NOT NULL,
  `tipo_habilidad_id` INT NOT NULL,
  PRIMARY KEY (`id`),
 
  CONSTRAINT `fk_habilidades_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolioWeb`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habilidades_tipo_habilidad1`
    FOREIGN KEY (`tipo_habilidad_id`)
    REFERENCES `portfolioWeb`.`tipo_habilidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`proyecto` (
  `id` INT NOT NULL,
  `imagen` VARCHAR(100) NULL,
  `descripcion` VARCHAR(200) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  
  CONSTRAINT `fk_proyecto_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolioWeb`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`tecnologias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`tecnologias` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `proyecto_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  
  CONSTRAINT `fk_tecnologias_proyecto1`
    FOREIGN KEY (`proyecto_id`)
    REFERENCES `portfolioWeb`.`proyecto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
