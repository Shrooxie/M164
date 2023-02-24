/*
Autor: Lara Helfenberger
Datum: 24.02.2023
DB: Videothek
*/

/* Datenbank löschen falls sie existiert*/
DROP DATABASE IF EXISTS Videothek;

/* Datenbank erstellen */
CREATE DATABASE Videothek;

/* Datenbank aktivieren */
USE Videothek;

/* Filmtabelle erstellen */
CREATE TABLE Film
(
id_Film INT NOT NULL AUTO_INCREMENT,
Titel VARCHAR(50) NOT NULL,
Dauer TIME NOT NULL,
Kategorie VARCHAR(3) NOT NULL,
Jahr YEAR NOT NULL,
Frei_ab INT NOT NULL,
PreisProTag DECIMAL(4,2) NOT NULL,
EPreis DECIMAL(4,2) NOT NULL,
Lagerbestand INT NOT NULL DEFAULT '1',
PRIMARY KEY (id_Film)
)ENGINE = InnoDB
;

/* Kundentabelle erstellen */
CREATE TABLE Kunde
(
id_Kunde INT NOT NULL AUTO_INCREMENT,
Anrede ENUM('Herr','Frau') NOT NULL,
Vorname VARCHAR(50) NOT NULL,
Nachname VARCHAR(50) NOT NULL,
Strasse VARCHAR(50) NOT NULL,
PLZ CHAR(4)NOT NULL,
Ort VARCHAR(50) NOT NULL,
Telefon VARCHAR(50) NOT NULL,
Geburtsdatum DATE NOT NULL,
PRIMARY KEY (id_Kunde)
)ENGINE = InnoDB
;

/* Ausleihtabelle erstellen */
CREATE TABLE Ausleihe
(
id_Ausleihe INT NOT NULL AUTO_INCREMENT,
fs_Kunde INTEGER NOT NULL,
fs_Film INTEGER NOT NULL,
Ausleihe DATE NOT NULL DEFAULT CURRENT_DATE(),
Rueckgabe DATE NOT NULL,
PRIMARY KEY (id_Ausleihe),
FOREIGN KEY(fs_Kunde) REFERENCES Kunde(id_Kunde),
FOREIGN KEY(fs_Film) REFERENCES Film(id_Film)
)ENGINE = InnoDB
;

/* Darstellertabelle erstellen */
CREATE TABLE Darsteller
(
id_Darsteller INT NOT NULL AUTO_INCREMENT,
Vorname VARCHAR(50) NOT NULL,
Nachname VARCHAR(50) NOT NULL,
PRIMARY KEY (id_Darsteller)
)ENGINE = InnoDB
;

/* Film_Darstellertabelle erstellen */
CREATE TABLE Film_Darsteller
(
fs_Film INTEGER NOT NULL,
fs_Darsteller INTEGER NOT NULL,
FOREIGN KEY(fs_Film) REFERENCES Film(id_Film),
FOREIGN KEY(fs_Darsteller) REFERENCES Darsteller(id_Darsteller)
)ENGINE = InnoDB
;

/* Regisseurtabelle erstellen */
CREATE TABLE Regisseur
(
id_Regisseur INT NOT NULL AUTO_INCREMENT,
Vorname VARCHAR(50) NOT NULL,
Nachname VARCHAR(50) NOT NULL,
PRIMARY KEY (id_Regisseur)
)ENGINE = InnoDB
;

/* Film_Regisseurtabelle erstellen */
CREATE TABLE Film_Regisseur
(
fs_Film INTEGER NOT NULL,
fs_Regisseur INTEGER NOT NULL,
FOREIGN KEY(fs_Film) REFERENCES Film(id_Film),
FOREIGN KEY(fs_Regisseur) REFERENCES Regisseur(id_Regisseur)
)ENGINE = InnoDB
;