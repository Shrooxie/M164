DROP DATABASE IF EXISTS post;

/* Datenbank erstellen */
CREATE DATABASE post;

/* Datenbank aktivieren */
USE post;

CREATE TABLE Strasse
(
id_Strasse INT NOT NULL AUTO_INCREMENT,
Strassenbezkurz VARCHAR(18),
Strassenbezlang VARCHAR(80),
Lokationstyp VARCHAR(40),
Hausnummer VARCHAR(4),
PRIMARY KEY (id_Strasse)
)ENGINE = InnoDB
;

CREATE TABLE Ort
(
id_Ort INT NOT NULL AUTO_INCREMENT,
PLZ INT,
Ort VARCHAR(27),
Kanton VARCHAR(2),
Sprache INT,
PRIMARY KEY (id_Ort)
)ENGINE = InnoDB
;

CREATE TABLE Adresse
(
id_Adresse INT NOT NULL AUTO_INCREMENT,
fs_Ort INT,
fs_Strasse INT,
PRIMARY KEY (id_Adresse),
FOREIGN KEY (fs_Ort) REFERENCES Ort(id_Ort),
FOREIGN KEY (fs_Strasse) REFERENCES Strasse(id_Strasse)
)ENGINE = InnoDB
;

CREATE TABLE Person
(
id_Person INT NOT NULL AUTO_INCREMENT,
fs_Adresse INT,
Vorname VARCHAR(50) NOT NULL,
Name VARCHAR(50) NOT NULL,
Geburtsdatum DATE,
PRIMARY KEY (id_Person),
FOREIGN KEY (fs_Adresse) REFERENCES Adresse(id_Adresse)
)ENGINE = InnoDB
;
