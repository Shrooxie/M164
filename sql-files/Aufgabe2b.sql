/*
Autor: Lara Helfenberger
Datum: 24.02.2023
DB: Videothek
*/

/* Datenbank löschen falls sie existiert*/
DROP DATABASE IF EXISTS Aufgabe2b;

/* Datenbank erstellen */
CREATE DATABASE Aufgabe2b;

/* Datenbank aktivieren */
USE Aufgabe2b;

/* Abteilung */
CREATE TABLE Abteilung
(
Abteilungsnr INT NOT NULL,
Bezeichnung VARCHAR(50) NOT NULL,
PRIMARY KEY (Abteilungsnr)
)ENGINE = InnoDB
;

/* Mitarbeiter */
CREATE TABLE Mitarbeiter
(
Mitarbeiter INT NOT NULL,
Name VARCHAR(50) NOT NULL,
Vorname VARCHAR(50) NOT NULL,
Strasse VARCHAR(50),
PLZ CHAR(14) NOT NULL,
Ort VARCHAR(50) NOT NULL,
Gehalt DECIMAL(10,2),
Abteilung INTEGER NOT NULL,
Telefonnummer VARCHAR(25),
Email VARCHAR(50) NOT NULL,
Eintrittsdatum DATE,
PRIMARY KEY (Mitarbeiter),
FOREIGN KEY(Abteilung) REFERENCES Abteilung(Abteilungsnr)
)ENGINE = InnoDB
;

CREATE TABLE Jobticket
(
id INT NOT NULL,
Mitarbeiter INTEGER NOT NULL,
FOREIGN KEY(Mitarbeiter) REFERENCES Mitarbeiter(Mitarbeiter),
Gueltig_bis DATE 
)ENGINE = InnoDB
;

CREATE TABLE Kunde
(
Kundenr INT NOT NULL,
Name VARCHAR(50) NOT NULL,
Vorname VARCHAR(50) NOT NULL,
Strasse VARCHAR(50),
PLZ CHAR(14) NOT NULL,
Ort VARCHAR(50) NOT NULL,
Telefon_Gesch VARCHAR(25),
Telefon_Privat VARCHAR(25),
Email VARCHAR(50) NOT NULL,
Zahlungsart CHAR(1),
PRIMARY KEY (Kunde)
)ENGINE = InnoDB
;


CREATE TABLE Bestellung
(
Bestellnr INT NOT NULL,
Kundenr INTEGER NOT NULL,
Bestelldatum DATE NOT NULL,
Lieferdatum DATE,
Rechnugsbetrag DECIMAL(10,2),
PRIMARY KEY (Bestellnr),
FOREIGN KEY(Kundenr) REFERENCES Kunde(Kundenr)
)ENGINE = InnoDB
;

CREATE TABLE Hersteller
(
Herstellernr INT NOT NULL,
Name VARCHAR(50) NOT NULL,
PRIMARY KEY (Herstellernr),
)ENGINE = InnoDB
;

CREATE TABLE Kategorie
(
Kategoriernr INT NOT NULL,
Bezeichnung VARCHAR(50) NOT NULL,
PRIMARY KEY (Kategorienr),
)ENGINE = InnoDB
;

CREATE TABLE MWSTSatz
(
MWSTnr INT NOT NULL,
Prozent DECIMAL(4,2),
PRIMARY KEY (MWSTnr),
)ENGINE = InnoDB
;


/* Animaltabelle erstellen */
CREATE TABLE Artikel
(
Artikelnr INT NOT NULL,
Bezeichnung VARCHAR(50) NOT NULL,
Hersteller INTEGER NOT NULL,
Nettopreis DECIMAL(10,2),
MWST INTEGER NOT NULL,
Bestand INT NOT NULL,
Mindestbestand INT NOT NULL,
Kategorie INTEGER NOT NULL,
Bestellvorschlag CHAR(1),
PRIMARY KEY (Artikelnr),
FOREIGN KEY(Hersteller) REFERENCES Hersteller(Herstellernr),
FOREIGN KEY(MWST) REFERENCES MWSTSatz(MWSTnr),
FOREIGN KEY(Kategorie) REFERENCES Kategorie(Kategorienr)
)ENGINE = InnoDB
;

CREATE TABLE Posten
(
Bestellnr INTEGER NOT NULL,
Artikelnr INTEGER NOT NULL,
Bestellmenge INT NOT NULL,
Liefermenge INT,
FOREIGN KEY(Bestellnr) REFERENCES Bestellung(Bestellnr),
FOREIGN KEY(Artikelnr) REFERENCES Artikel(Artikelnr)
)ENGINE = InnoDB
;

