/*
Autor: Lara Helfenberger
Datum: 24.02.2023
DB: Videothek
*/

/* Datenbank löschen falls sie existiert*/
DROP DATABASE IF EXISTS Aufgabe2a;

/* Datenbank erstellen */
CREATE DATABASE Aufgabe2a;

/* Datenbank aktivieren */
USE Aufgabe2a;

/* Towntabelle erstellen */
CREATE TABLE Town
(
id INT NOT NULL,
Zip CHAR(10) NOT NULL,
City VARCHAR(45) NOT NULL,
PRIMARY KEY (id)
)ENGINE = InnoDB
;
/* Addresstabelle erstellen */
CREATE TABLE Address
(
id INT NOT NULL,
Strasse VARCHAR(45) NOT NULL,
Town INTEGER NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY(Town) REFERENCES Town(id)
)ENGINE = InnoDB
;

/* Usertabelle erstellen */
CREATE TABLE User
(
id INT NOT NULL,
username VARCHAR(45) NOT NULL,
passwordhash VARCHAR(45) NOT NULL,
Address INTEGER NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY(Address) REFERENCES Address(id)
)ENGINE = InnoDB
;

/* FurColortabelle erstellen */
CREATE TABLE FurColor
(
id INT NOT NULL,
ColorName VARCHAR(45) NOT NULL,
PRIMARY KEY (id)
)ENGINE = InnoDB
;

/* Racetabelle erstellen */
CREATE TABLE Race
(
id INT NOT NULL,
RaceName VARCHAR(45) NOT NULL,
PRIMARY KEY (id)
)ENGINE = InnoDB
;

/* Animaltabelle erstellen */
CREATE TABLE Animal
(
id INT NOT NULL,
User INTEGER NOT NULL,
Name VARCHAR(45) NOT NULL,
DateOfBirth DATE NOT NULL,
AnimalCode Char(22) NOT NULL,
FurColor INTEGER NOT NULL,
Race_id INTEGER NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY(User) REFERENCES User(id),
FOREIGN KEY(FurColor) REFERENCES FurColor(id),
FOREIGN KEY(Race_id) REFERENCES Race(id)
)ENGINE = InnoDB
;
