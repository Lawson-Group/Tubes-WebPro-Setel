/* Membuat Database */
CREATE DATABASE IF NOT EXISTS test;
USE setel;


/* Tabel Admin - LoginPage */
CREATE TABLE IF NOT EXISTS Admin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usr VARCHAR(10),
  pwd VARCHAR(10)
);

INSERT INTO admin (usr, pwd) VALUES ('Jean', 'admin001');
INSERT INTO admin (usr, pwd) VALUES ('Aisha', 'admin002');
INSERT INTO admin (usr, pwd) VALUES ('Jannah', 'admin003');
INSERT INTO admin (usr, pwd) VALUES ('Novita', 'admin004');
INSERT INTO admin (usr, pwd) VALUES ('Triani', 'admin005');


/* Tabel Kendaraan - Inventory Page */
CREATE TABLE IF NOT EXISTS Kendaraan (
  idKendaraan INT AUTO_INCREMENT PRIMARY KEY,
  nomorUnit VARCHAR(10),
  jenisKendaraan VARCHAR(10),
  shelter VARCHAR(20),
  status VARCHAR(12)
);

INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES ('A001', 'Sepeda', 'TULT', 'Available');
INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES ('B002', 'Skuter', 'GKU', 'Available');
INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES ('A003', 'Sepeda', 'Open Library', 'Unavailable');
INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES ('B004', 'Skuter', 'MSU', 'Available');
INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES ('A005', 'Sepeda', 'TULT', 'Unavailable');
INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES ('B006', 'Skuter', 'GKU', 'Available');
INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES ('A007', 'Sepeda', 'Open Library', 'Available');
INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES ('B008', 'Skuter', 'MSU', 'Unavailable');
INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES ('A009', 'Sepeda', 'TULT', 'Available');
INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES ('B010', 'Skuter', 'GKU', 'Available');


/* Table informasi - Dashboard Page */
CREATE TABLE IF NOT EXISTS Informasi (
    idInfomrasi SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    amount VARCHAR(50) NOT NULL,
    titleDetails VARCHAR(255) NOT NULL,
    unitSepeda VARCHAR(255) NOT NULL,
    unitSkuter VARCHAR(255) NOT NULL,
    imageSource VARCHAR(255) NOT NULL
);

INSERT INTO Informasi (title, amount, titleDetails, unitSepeda, unitSkuter, imageSource)
VALUES
    ('Peminjaman', '200 units', 'Jumlah Peminjaman Kendaraan', 'Sepeda 100 units', 'Skuter 100 units', 'ride-dbp.png'),
    ('Kendaraan', '400 units', 'Jumlah Kendaraan Tersedia', 'Sepeda 200 units', 'Skuter 200 units', 'vehicle-dbp.png'),
    ('Maintenance', '20 units', 'Jumlah Kendaraan Diperbaiki', 'Sepeda 10 units', 'Skuter 10 units', 'maintenance-dbp.png');



/* Table Shelter - Dashboard Page */
CREATE TABLE IF NOT EXISTS Shelter (
    idShelter INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    title2 VARCHAR(255) NOT NULL,
    shelter VARCHAR(255) NOT NULL,
    alt VARCHAR(255) NOT NULL,
    unit VARCHAR(255) NOT NULL
);

INSERT INTO Shelter (title, title2, shelter, alt, unit)
VALUES
    ('Shelter TULT', 'Gedung Telkom University Landmark Tower', 'tult.jpg', 'shelter_1', 'Tersedia 50 units'),
    ('Shelter GKU', 'Gedung Tokong Nanas', 'gku.jpg', 'shelter_2', 'Tersedia 50 units'),
    ('Shelter Oplib', 'Gedung Open Library', 'oplib.jpg', 'shelter 3', 'Tersedia 50 units'),
    ('Shelter MSU', 'Masjid Syamsul ''Ulum', 'msu.jpg', 'shelter_4', 'Tersedia 50 units');


/* Table Report-ReportPage*/
CREATE TABLE IF NOT EXISTS Report (
  idPeminjaman INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(10),
  tgl_wkt DATETIME,
  noUnit VARCHAR(10),
  jenisKendaraan VARCHAR(10),
  shelterAwal VARCHAR(15),
  shelterAkhir VARCHAR(15)
);

INSERT INTO Report (username, tgl_wkt, noUnit, jenisKendaraan, shelterAwal, shelterAkhir) VALUES ('Jannah','2023-10-15 07:32:44','A003','Sepeda', 'GKU', 'OPLIB');
INSERT INTO Report (username, tgl_wkt, noUnit, jenisKendaraan, shelterAwal, shelterAkhir) VALUES ('Aisha','2023-10-16 09:41:20','A004','Sepeda', 'MSU', 'OPLIB');
INSERT INTO Report (username, tgl_wkt, noUnit, jenisKendaraan, shelterAwal, shelterAkhir) VALUES ('Novita','2023-10-17 10:12:59','A005','Sepeda', 'GKU', 'TULT');
INSERT INTO Report (username, tgl_wkt, noUnit, jenisKendaraan, shelterAwal, shelterAkhir) VALUES ('Triep','2023-05-15 08:32:44','B001','Sekuter', 'OPLIB', 'MSU');
INSERT INTO Report (username, tgl_wkt, noUnit, jenisKendaraan, shelterAwal, shelterAkhir) VALUES ('Jeanr','2023-10-16 09:41:20','A001','Sepeda', 'GKU', 'TULT');
INSERT INTO Report (username, tgl_wkt, noUnit, jenisKendaraan, shelterAwal, shelterAkhir) VALUES ('Novis','2023-10-17 10:12:59','B003','Sekuter', 'GKU', 'OPLIB');
INSERT INTO Report (username, tgl_wkt, noUnit, jenisKendaraan, shelterAwal, shelterAkhir) VALUES ('Rohmah','2023-10-15 07:32:44','A003','Sepeda', 'MSU', 'OPLIB');
INSERT INTO Report (username, tgl_wkt, noUnit, jenisKendaraan, shelterAwal, shelterAkhir) VALUES ('Putri','2023-10-16 09:41:20','B002','Sekuter', 'GKU', 'MSU');
INSERT INTO Report (username, tgl_wkt, noUnit, jenisKendaraan, shelterAwal, shelterAkhir) VALUES ('Himeko','2023-10-17 10:12:59','A006','Sepeda', 'MSU', 'TULT');


/* Tabel Feedback - FeedbackPage*/
CREATE TABLE IF NOT EXISTS Feedback (
  idFeedback INT PRIMARY KEY,
  nim VARCHAR(20),
  username VARCHAR(50),
  timestamp DATETIME,
  text TEXT
);

INSERT INTO Feedback (idFeedback, nim, username, timestamp, text) VALUES
(1, '1302210004', 'jeanrikha', '2023-11-28 11:01:03', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum.'),
(2, '1302213030', 'novitasabila', '2023-11-25 07:11:02', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(3, '1302213038', 'aishueo', '2023-11-19 05:09:11', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum.'),
(4, '1302213051', 'jannatinurrohmah', '2023-11-15 17:19:23', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.'),
(5, '1302213091', 'trianipmumpuni', '2023-11-10 20:02:49', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula'),
(6, '1302213007', 'aerichanie', '2023-10-31 15:03:19', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(7, '1204190002', 'karinateryoo', '2023-10-29 14:00:00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.'),
(8, '1653173301', 'ningningguang', '2023-10-28 17:04:11', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(9, '1282303218', 'huangren', '2023-10-27 12:57:34', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum.'),
(10, '1281999216', 'marklee', '2023-10-25 10:00:00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit.');