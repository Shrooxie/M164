/*
Autor: Lara Helfenberger
Datum: 21.02.2023
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
id_Videonummer INT NOT NULL AUTO_INCREMENT,
Titel VARCHAR(50) NOT NULL,
Dauer TIME NOT NULL,
Kategorie VARCHAR(3) NOT NULL,
Jahr YEAR NOT NULL,
Frei_ab INT NOT NULL,
PreisProTag DECIMAL(4,2) NOT NULL,
EPreis DECIMAL(4,2) NOT NULL,
Lagerbestand INT NOT NULL,
PRIMARY KEY (id_Videonummer)
)ENGINE = InnoDB
;

/* Kundentabelle erstellen */
CREATE TABLE Kunde
(
id_Kundennummer INT NOT NULL AUTO_INCREMENT,
Anrede ENUM('Herr','Frau') NOT NULL,
Vorname VARCHAR(50) NOT NULL,
Nachname VARCHAR(50) NOT NULL,
Strasse VARCHAR(50) NOT NULL,
PLZ CHAR(4)NOT NULL,
Ort VARCHAR(50) NOT NULL,
Telefon VARCHAR(50) NOT NULL,
Geburtsdatum DATE NOT NULL,
PRIMARY KEY (id_Kundennummer)
)ENGINE = InnoDB
;

/* Ausleihtabelle erstellen */
CREATE TABLE Ausleihe
(
id_Ausleihnr INT NOT NULL AUTO_INCREMENT,
fs_Kundennummer INTEGER NOT NULL,
fs_Videonummer INTEGER NOT NULL,
Ausleihe DATE NOT NULL,
Rueckgabe DATE NOT NULL,
PRIMARY KEY (id_Ausleihnr),
FOREIGN KEY(fs_Kundennummer) REFERENCES Kunde(id_Kundennummer),
FOREIGN KEY(fs_Videonummer) REFERENCES Film(id_Videonummer)
)ENGINE = InnoDB
;