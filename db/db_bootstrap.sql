-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database cool_db;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on cool_db.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
use cool_db;


-- Put your DDL
CREATE TABLE test_table (
  name VARCHAR(20),
  color VARCHAR(10)
);

-- Add sample data.
INSERT INTO test_table
  (name, color)
VALUES
  ('dev', 'blue'),
  ('pro', 'yellow'),
  ('junior', 'red');


CREATE TABLE Orders
(
  OrderID INT NOT NULL,
  ShipAddress VARCHAR(40) NOT NULL,
  Quantity INT NOT NULL,
  TotalPrice INT NOT NULL,
  OrderDate VARCHAR(40) NOT NULL,
  PRIMARY KEY (OrderID)
);

CREATE TABLE Confederation
(
  ConfederationID INT NOT NULL,
  Continent  VARCHAR(20) NOT NULL,
  PRIMARY KEY (ConfederationID),
  UNIQUE (Continent)
);

CREATE TABLE GroupTable
(
  GroupLetter CHAR NOT NULL,
  PRIMARY KEY (GroupLetter)
);

CREATE TABLE Country
(
  CountryID VARCHAR(50) NOT NULL,
  Ranking INT NOT NULL,
  CountryName VARCHAR(50) NOT NULL,
  LastChampionshipDate VARCHAR(20) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Password VARCHAR(20) NOT NULL,
  LastLogin VARCHAR(20) NOT NULL,
  DateJoined VARCHAR(20) NOT NULL,
  NumberOfCups INT NOT NULL,
  Coach VARCHAR(20) NOT NULL,
  ConfederationID INT,
  GroupLetter VARCHAR(20),
  PRIMARY KEY (CountryID),
  FOREIGN KEY (ConfederationID) REFERENCES Confederation(ConfederationID),
  FOREIGN KEY (GroupLetter) REFERENCES GroupTable(GroupLetter),
  UNIQUE (Ranking),
  UNIQUE (CountryName),
  UNIQUE (Email)
);

CREATE TABLE Player
(
  LastName VARCHAR(20) NOT NULL,
  JerseyNum INT NOT NULL,
  Age INT NOT NULL,
  ClubTeam VARCHAR(50) NOT NULL,
  CareerGoals INT NOT NULL,
  CareerAssists INT NOT NULL,
  CityOfBirth VARCHAR(40) NOT NULL,
  Position VARCHAR(20) NOT NULL,
  FirstName VARCHAR(20) NOT NULL,
  CountryName VARCHAR(50),
  PlayerID INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (PlayerID),
  FOREIGN KEY (CountryName) REFERENCES Country(CountryName)
);

CREATE TABLE AlbumCompany
(
  Password VARCHAR(40) NOT NULL,
  CompanyName VARCHAR(40) NOT NULL,
  ContactTitle VARCHAR(40) NOT NULL,
  Phone VARCHAR(40) NOT NULL,
  Address VARCHAR(40) NOT NULL,
  City VARCHAR(40) NOT NULL,
  PostalCode INT NOT NULL,
  LastLogin VARCHAR(40) NOT NULL,
  Email VARCHAR(40) NOT NULL,
  DateJoined VARCHAR(40) NOT NULL,
  CompanyID VARCHAR(40) NOT NULL,
  ContactName VARCHAR(40) NOT NULL,
  OrderID INT NOT NULL,
  CountryName VARCHAR(50),
  PRIMARY KEY (CompanyID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (CountryName) REFERENCES Country(CountryName),
  UNIQUE (Email)
);

CREATE TABLE Customer
(
  DateJoined VARCHAR(40) NOT NULL,
  Password VARCHAR(40) NOT NULL,
  Email VARCHAR(40) NOT NULL,
  CostumerID INT NOT NULL AUTO_INCREMENT,
  FirstName VARCHAR(40) NOT NULL,
  LastName VARCHAR(40) NOT NULL,
  Phone VARCHAR(40) NOT NULL,
  CountryName VARCHAR(50),
  PRIMARY KEY (CostumerID),
  FOREIGN KEY (CountryName) REFERENCES Country(CountryName),
  UNIQUE (Email)
);

CREATE TABLE Ordered
(
  OrderID INT NOT NULL,
  CostumerID INT NOT NULL,
  PRIMARY KEY (OrderID, CostumerID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (CostumerID) REFERENCES Customer(CostumerID)
);


insert into GroupTable (GroupLetter) values ('A');
insert into GroupTable (GroupLetter) values ('B');
insert into GroupTable (GroupLetter) values ('C');
insert into GroupTable (GroupLetter) values ('D');
insert into GroupTable (GroupLetter) values ('E');
insert into GroupTable (GroupLetter) values ('F');
insert into GroupTable (GroupLetter) values ('G');
insert into GroupTable (GroupLetter) values ('H');



insert into Confederation (Continent, ConfederationID) values ('SA', '09046110');
insert into Confederation (Continent, ConfederationID) values ('OC', '49643336');
insert into Confederation (Continent, ConfederationID) values ('AS', '59779770');
insert into Confederation (Continent, ConfederationID) values ('NA', '23155166');
insert into Confederation (Continent, ConfederationID) values ('AF', '54575926');
insert into Confederation (Continent, ConfederationID) values ('EU', '00743799');


insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (1, 'China', '8/24/2022', 'fgoly0@un.org', 'L5IKlXPPk7go', '11/10/2022', '11/3/2022', 1, 'Franky Goly', '03235e090461105b-ef70-47d9-9b8c-f845d9b1fb8a');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (2, 'Russia', '7/17/2022', 'tuebel1@nasa.gov', '6gZvtnjaz8', '12/1/2021', '9/12/2022', 4, 'Tamas Uebel', 'caed2aa8-34da-4380-946a-30713b40f14b');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (3, 'Mongolia', '3/9/2022', 'jwybrew2@last.fm', 'ziImsbpnCx1e', '12/23/2021', '4/6/2022', 5, 'Jarrod Wybrew', 'e5c2353a-8d38-40c3-b77e-5e8f37b14409');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (4, 'Uzbekistan', '2/22/2022', 'ablasing3@cmu.edu', 'sKN7xHss', '1/17/2022', '1/5/2022', 4, 'Ariel Blasing', '80ac99e4-98a1-4b2b-9f6b-a9bab58d3c1b');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (6, 'Greece', '9/18/2022', 'jclementel5@addthis.com', 'Y6AqwoR9OcC7', '11/5/2022', '1/9/2022', 5, 'Josephine Clementel', 'dd74bb32-6a78-4c62-89e5-b9fad4d8492d');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (11, 'Portugal', '3/8/2022', 'mdaverana@youku.com', 'gp6Hg9lb', '10/8/2022', '9/15/2022', 6, 'Miriam Daveran', 'ff436fa7-133b-411e-bc6f-88462ad04cdf');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (14, 'Guyana', '12/21/2021', 'emoylaned@nsw.gov.au', 'vYq9K5duPQK', '3/10/2022', '11/10/2022', 1, 'Eleanora Moylane', '4d41a28f-fdf2-455d-877a-c2e22003e493');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (15, 'Indonesia', '11/21/2021', 'jduigenane@hexun.com', '9VekDLmIyZJ', '6/19/2022', '3/30/2022', 3, 'Jenna Duigenan', '47965b1c-7532-457f-906a-f0e40683ed3d');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (18, 'France', '6/11/2022', 'ddeh@fda.gov', '3PNdwL', '11/7/2022', '1/3/2022', 4, 'Dalenna De Maine', '076ae465-b683-4276-9627-d3d124f07dc0');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (19, 'Ukraine', '1/14/2022', 'esaladinoi@unicef.org', '5P19REeXWc0U', '10/30/2022', '6/30/2022', 2, 'Etheline Saladino', 'd8ec8d04-2f2e-4301-992f-7b31be51b5ee');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (20, 'Venezuela', '12/15/2021', 'sdudgeonj@nature.com', 'JtwHTAl', '8/25/2022', '10/29/2022', 4, 'Sydel Dudgeon', 'd1eb8025-7e89-4b65-951b-a3b2b45a4c9e');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (24, 'Kiribati', '1/1/2022', 'agerhtsn@yellowbook.com', 'tIKYp547', '3/20/2022', '3/22/2022', 6, 'Averil Gerhts', '59bd8df1-9df3-417e-aafd-12bb57bf606e');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (26, 'Brazil', '2/19/2022', 'lmayzesp@sakura.ne.jp', 'DjWYdU', '4/28/2022', '8/6/2022', 4, 'Leandra Mayzes', '0d381512-e046-4a7f-9a46-d8be8ed7ee8a');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (28, 'Nicaragua', '5/10/2022', 'abyramr@abc.net.au', 'zTIzqUT', '6/2/2022', '12/17/2021', 5, 'Alford Byram', '408d6376-3d66-4ecb-83e0-7987c390d697');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (30, 'Mexico', '9/13/2022', 'lborsnallt@narod.ru', 'XKLWJvv', '1/24/2022', '4/19/2022', 1, 'Leanor Borsnall', 'b862b51a-2038-405e-a93d-32fe17c35322');
insert into Country (Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, CountryID) values (32, 'Tanzania', '10/2/2022', 'btomickiv@tumblr.com', 'eXDGGnn0IN', '1/7/2022', '2/12/2022', 1, 'Bella Tomicki', '9770230f-c4d1-42ae-a856-0dc6d563eff5');


insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gladbach', 25, 25, 'Devshare', 74, 93, 'Sŏnbong', 11, 'Isabelle', 'Guyana');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Still', 24, 26, 'Browseblab', 23, 36, 'Qidi', 5, 'Linn', 'Guyana');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Kuzma', 35, 21, 'Roodel', 46, 43, 'Ibara', 7, 'Cassandre', 'Guyana');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Tiffney', 19, 21, 'Dynabox', 63, 36, 'Triánta', 8, 'Fowler', 'Guyana');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Latore', 11, 30, 'Yozio', 28, 69, 'Santo Antônio do Monte', 7, 'Maudie', 'Guyana');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Landman', 33, 21, 'Tagfeed', 8, 65, 'Sangke', 3, 'Gerti', 'Guyana');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Neasam', 34, 24, 'Vimbo', 19, 85, 'Shalang', 4, 'Johnath', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Godsal', 6, 23, 'Ailane', 78, 7, 'Ferreiros', 9, 'Shalne', 'Guyana');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gerrelt', 23, 19, 'Cogilith', 44, 34, 'Matiao', 2, 'Sib', 'Guyana');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Huerta', 29, 29, 'Lazz', 34, 65, 'Vievis', 8, 'Harman', 'Guyana');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Deverick', 18, 26, 'Vipe', 83, 34, 'Katsina-Ala', 7, 'Wenonah', 'Mongolia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Chasney', 39, 29, 'Mycat', 45, 7, 'Anadia', 1, 'Patsy', 'Mongolia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Redan', 26, 18, 'Fivebridge', 60, 22, 'Wangdian', 8, 'Urban', 'Mongolia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Izatt', 13, 19, 'Jayo', 1, 12, 'Clarines', 5, 'Maureene', 'Mongolia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Rydings', 36, 27, 'Reallinks', 64, 1, 'Cincinnati', 6, 'Goldie', 'Mongolia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Draycott', 77, 18, 'Kanoodle', 14, 30, 'Santa Rita Village', 11, 'Ilysa', 'Mongolia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Joynt', 16, 23, 'Blogtag', 76, 28, 'Arlington', 9, 'Silvanus', 'Mongolia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Elfleet', 22, 22, 'Kwideo', 5, 62, 'Mlonggo', 4, 'Dolly', 'Mongolia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Popplewell', 3, 28, 'Yakidoo', 72, 24, 'La Sabana', 7, 'Keith', 'Mongolia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Northall', 88, 25, 'Shuffletag', 59, 64, 'Novhorod-Sivers’kyy', 9, 'Jerrold', 'Mongolia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Kittiman', 17, 21, 'Twimm', 23, 58, 'Grand Rapids', 1, 'Othello', 'Guyana');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Duffit', 99, 27, 'Ooba', 25, 10, 'Diên Khánh', 3, 'Sherrie', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Burger', 8, 27, 'Jaxspan', 53, 39, 'Novyye Cherëmushki', 5, 'Ingaberg', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Mougenel', 21, 27, 'Zoomzone', 94, 68, 'Sugihwaras', 4, 'Bondy', 'Kiribati');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Daveren', 7, 18, 'Blognation', 86, 93, 'Chandmanĭ', 7, 'Billie', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gerrans', 9, 26, 'Jaxbean', 70, 87, 'Abaza', 11, 'Cyndy', 'Kiribati');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Crim', 1, 18, 'Blogtag', 32, 82, 'Yinglan', 3, 'Gerome', 'Kiribati' );
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Seager', 2, 29, 'Tanoodle', 29, 75, 'Gustavsberg', 4, 'Silva', 'Uzbekistan');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Challes', 4, 26, 'Yakijo', 86, 24, 'Sergelen', 3, 'Kanya', 'Uzbekistan');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Huff', 10, 19, 'Mydeo', 17, 81, 'Bera', 5, 'Moishe', 'Kiribati');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Hover', 14, 30, 'Tavu', 27, 68, 'Yaosai', 2, 'Darn', 'Uzbekistan');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Chippendale', 12, 28, 'Skinte', 3, 55, 'Novovolyns’k', 1, 'Denys', 'Uzbekistan');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Levin', 12, 28, 'Skinte', 3, 55, 'Novovolyns’k', 1, 'Levin', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Graith', 37, 37, 'Stark, Schmidt and Barton', 43, 5, 'Karlivka', 6, 'Sebastiano', 'Ukraine');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Wharrier', 76, 38, 'Powlowski, Barrows and DuBuque', 7, 66, 'Ervedosa do Douro', 6, 'Kary', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Menco', 59, 10, 'Jacobs-Yundt', 68, 31, 'Haizigou', 7, 'Jodie', 'Kiribati');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Haith', 43, 29, 'Pollich-Lesch', 1, 3, 'Barreiros', 4, 'Artie', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Dinjes', 70, 22, 'Gusikowski-Wolf', 83, 15, 'Xujiaqiao', 10, 'Joann', 'Kiribati');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Swateridge', 61, 32, 'Nicolas and Sons', 76, 14, 'Xiashe', 1, 'Rosa', 'Uzbekistan');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Baish', 35, 33, 'Pouros-Moen', 61, 21, 'Butungan', 9, 'Berny', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Althrope', 30, 8, 'Mohr Inc', 6, 2, 'Zhixia', 8, 'Butch', 'Kiribati');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Olanda', 4, 2, 'Kemmer, Abshire and Abernathy', 87, 38, 'Chernoyerkovskaya', 8, 'Torr', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Goodered', 10, 11, 'Graham and Sons', 13, 6, 'Suidong', 3, 'Gare', 'Kiribati');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Chastanet', 60, 38, 'Dibbert-Gutmann', 36, 59, 'Linjiang', 8, 'Matthew', 'Kiribati');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Silverston', 90, 20, 'Turcotte Group', 56, 25, 'Lasiana', 6, 'Erv', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Eustis', 4, 21, 'Hartmann Group', 27, 10, 'Changling', 9, 'Henrik', 'Uzbekistan');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Shakeshaft', 95, 24, 'Wuckert, Dickens and Romaguera', 46, 53, 'Daduo', 1, 'Leonora', 'Kiribati');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Bulcroft', 47, 15, 'Sawayn and Sons', 93, 38, 'Ilanskiy', 7, 'Luke', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Inmett', 24, 29, 'Gutmann-Stroman', 29, 14, 'Kurnia', 4, 'Cammy', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Sollis', 65, 24, 'Johnston Inc', 56, 35, 'Siak Sri Indrapura', 10, 'Etti', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Rosso', 5, 15, 'Yundt, Watsica and Jacobs', 12, 21, 'Longhua', 1, 'Odilia', 'Uzbekistan');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Stonary', 77, 28, 'Grimes Group', 23, 51, 'Simpang', 3, 'Joellyn', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Tolchar', 80, 33, 'Swaniawski Group', 54, 46, 'Cinangka', 2, 'Bret', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Klempke', 74, 13, 'Shields LLC', 69, 65, 'Quintã', 7, 'Hermione', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Tartt', 13, 12, 'Feeney-Labadie', 23, 42, 'Yuanlin', 7, 'Ignaz', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Edwins', 16, 11, 'Mann and Sons', 80, 57, 'Itupeva', 3, 'Oona', 'Brazil');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Estcourt', 88, 33, 'Streich Inc', 31, 39, 'Sikka', 1, 'Cyndia', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Alebrooke', 72, 35, 'Douglas LLC', 30, 66, 'Heping', 1, 'Minette', 'Uzbekistan');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Mongan', 69, 28, 'Moore LLC', 37, 47, 'Hong’an Chengguanzhen', 2, 'Lexi', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Etridge', 88, 9, 'Corwin, Champlin and Berge', 94, 40, 'Dongqiao', 10, 'Erik', 'Uzbekistan');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Joddens', 91, 36, 'Roberts LLC', 50, 49, 'Xiniu', 1, 'Abbe', 'Uzbekistan');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Wankel', 10, 24, 'Ruecker, O''Kon and Predovic', 100, 35, 'Perpignan', 3, 'Sabine', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Arnley', 17, 20, 'Wehner, Ankunding and Quigley', 39, 81, 'Degan', 9, 'Engracia', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Noyes', 81, 37, 'Conroy, O''Kon and Hayes', 14, 78, 'Guiping', 9, 'Melonie', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Hefferan', 81, 14, 'Rice, Rogahn and Kris', 77, 70, 'Qiaotou', 5, 'Michaella', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Stewart', 5, 28, 'Streich LLC', 5, 19, 'Shi’an', 8, 'Myrtle', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Sergeant', 56, 12, 'Bergnaum, Ziemann and Treutel', 71, 4, 'Tongyuanpu', 4, 'Packston', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Liddard', 53, 39, 'Frami LLC', 94, 69, 'Vila Fria', 6, 'Esmeralda', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Bridgett', 5, 1, 'Orn, Tremblay and Stokes', 66, 6, 'Parintins', 11, 'Beatrice', 'Brazil');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gallaher', 34, 17, 'Hilll-West', 26, 65, 'Troparëvo', 7, 'Devy', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Vina', 95, 9, 'Jacobson, Hudson and Denesik', 1, 79, 'Telagasari', 11, 'Breanne', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Sambell', 78, 35, 'Ryan, Wintheiser and Jenkins', 35, 84, 'Sumberbakti', 10, 'Emlen', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Dwyr', 57, 27, 'Boyle, Spencer and Reilly', 69, 67, 'Sanying', 9, 'Kellen', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Meredyth', 67, 6, 'Wuckert, Russel and Cruickshank', 46, 85, 'Hanfeng', 10, 'Kelley', 'Tanzania');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Durston', 13, 21, 'Donnelly-Okuneva', 57, 38, 'Krajan', 7, 'Vivyan', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Darlow', 33, 19, 'Metz, Langosh and Schultz', 34, 32, 'Morez', 9, 'Nels', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Graveston', 5, 33, 'Roberts-Ritchie', 9, 92, 'La Unión', 1, 'Ganny', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Yanne', 32, 9, 'Rowe-Haag', 49, 39, 'Tegalwero', 7, 'Athena', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Beaument', 13, 17, 'Hammes and Sons', 100, 97, 'Sokol’skoye', 8, 'Ken', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Jonk', 94, 24, 'Miller Inc', 44, 53, 'Savyntsi', 5, 'Victoria', 'Ukraine');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Dawidowicz', 1, 8, 'Smitham Group', 2, 94, 'Wonorejo', 9, 'Guinna', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Humbee', 78, 34, 'Koss Inc', 28, 3, 'Barreiros', 7, 'Cookie', 'Brazil');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Cowgill', 43, 33, 'Goldner-Zemlak', 92, 33, 'Baião', 7, 'Isadora', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Jerrom', 64, 20, 'Treutel LLC', 86, 40, 'Bantilan', 11, 'Inigo', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Boxer', 66, 24, 'Skiles-Cremin', 27, 30, 'Shangtuhai', 3, 'Crista', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Brockie', 48, 7, 'Brekke, Graham and Willms', 37, 68, 'Saint-Étienne-du-Rouvray', 1, 'Leopold', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Reuter', 8, 33, 'Turcotte and Sons', 89, 93, 'Monastirákion', 1, 'Oneida', 'Greece');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Ughini', 28, 27, 'Fisher Group', 46, 5, 'Jiazhuyuan', 1, 'Nathaniel', 'Nicaragua');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Manie', 92, 13, 'Dicki, Armstrong and Cremin', 33, 70, 'Sukasada', 1, 'Walker', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Waite', 35, 16, 'Conroy, Pfannerstill and Stark', 16, 83, 'Chang’an', 9, 'Taite', 'Nicaragua');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Peeke', 99, 37, 'Zemlak-Konopelski', 55, 12, 'Chengdu', 4, 'Keefe', 'Nicaragua');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Greste', 37, 38, 'Gorczany, Runte and Batz', 35, 88, 'Zala', 1, 'Missy', 'Nicaragua');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Salatino', 34, 7, 'Schowalter and Sons', 23, 9, 'Changxuanling', 3, 'Peta', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Yakubov', 59, 15, 'Doyle-Zulauf', 16, 45, 'Narukan', 4, 'Lauraine', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Oldroyde', 63, 21, 'Trantow-Ledner', 7, 32, 'Hengli', 3, 'Mathilda', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gambrell', 79, 40, 'Spencer-Swift', 98, 36, 'Kalino', 9, 'Bary', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Stennes', 66, 1, 'Dare, Ferry and Berge', 98, 80, 'Agen', 4, 'Charis', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Shower', 1, 7, 'Pouros-Champlin', 2, 12, 'Novyy Starodub', 5, 'Aryn', 'Ukraine');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Dmitr', 52, 12, 'Hickle-Hayes', 62, 36, 'Vila Maior', 7, 'Prentice', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Scoates', 19, 13, 'Gerlach Group', 77, 1, 'Baima', 4, 'Fayette', 'Nicaragua');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Scotchmor', 58, 36, 'Vandervort-Ebert', 10, 78, 'Vélizy-Villacoublay', 6, 'Felicia', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Lattimer', 76, 3, 'Walsh-Lynch', 50, 77, 'Lingdangge', 3, 'Alon', 'Nicaragua');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Ambrosch', 71, 25, 'Buckridge-Yost', 6, 17, 'Nabire', 8, 'Lenci', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Rawstorn', 58, 26, 'Kshlerin, Johnson and Harris', 24, 38, 'Jatipamor', 7, 'Janie', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Dingivan', 22, 24, 'Predovic and Sons', 51, 19, 'Cigagade', 8, 'Florie', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Pepi', 47, 35, 'Kling and Sons', 99, 98, 'Saraktash', 6, 'Philipa', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Bonn', 14, 31, 'MacGyver-Mraz', 58, 85, 'Jianli', 1, 'Liv', 'Nicaragua');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('O''Tierney', 68, 28, 'Macejkovic-Wunsch', 7, 55, 'Lityn', 11, 'Wernher', 'Ukraine');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('McCart', 27, 11, 'Steuber, Pfannerstill and Jakubowski', 36, 75, 'Madur', 9, 'Scotty', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Tettersell', 51, 30, 'Leffler, Lockman and Christiansen', 30, 76, 'Karangasem', 11, 'Nanny', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Martinello', 53, 9, 'Parker, Pouros and Schulist', 53, 76, 'Huangtan', 6, 'Allina', 'Nicaragua');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Olin', 91, 18, 'Corwin and Sons', 99, 98, 'Mýki', 8, 'Veronica', 'Greece');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Longbothom', 37, 13, 'Barton-Parker', 92, 75, 'Jawa', 8, 'Eilis', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('MacDunlevy', 10, 33, 'Erdman-Thiel', 45, 30, 'Jiezi', 6, 'Nisse', 'Nicaragua');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Sandilands', 90, 32, 'Waters, Nicolas and Hegmann', 13, 54, 'Guatire', 1, 'Donnie', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('MacLure', 6, 28, 'Toy-McCullough', 69, 50, 'Macedo de Cavaleiros', 3, 'Dwain', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Scocroft', 82, 30, 'Bayer, Turcotte and Glover', 1, 48, 'Piraí do Sul', 5, 'Maire', 'Brazil');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Laughlin', 32, 24, 'Schroeder and Sons', 59, 98, 'Nantes', 3, 'Alwyn', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Surgener', 34, 17, 'Bogisich, Rippin and Zieme', 45, 57, 'Wololele A', 7, 'Debra', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Bonick', 13, 16, 'Fay, Gutmann and Konopelski', 1, 99, 'Lingyang', 8, 'Lennie', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('MacLaughlin', 22, 15, 'Moore, Dietrich and Boyle', 90, 93, 'Fengshan', 3, 'Iggie', 'Nicaragua');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Goucher', 77, 13, 'Fritsch, Quigley and Cole', 22, 9, 'Selydove', 4, 'Marcelia', 'Ukraine');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Mewett', 71, 36, 'Gutkowski-Keeling', 94, 83, 'Carrières-sur-Seine', 1, 'Lorelle', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gagin', 29, 21, 'Daugherty Inc', 15, 39, 'Tyachiv', 7, 'Darci', 'Ukraine');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Wrankmore', 33, 38, 'Sporer, Kulas and Grady', 2, 45, 'Qinglian', 7, 'Samara', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Winkle', 34, 30, 'Mosciski, Harber and Fritsch', 67, 95, 'Campinho', 4, 'Peirce', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Maple', 99, 19, 'Lehner, Tillman and Tillman', 34, 88, 'Jing’an', 9, 'Inna', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Whyard', 64, 32, 'Trantow LLC', 63, 14, 'Conchal', 7, 'Walliw', 'Brazil');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Mc Meekin', 33, 31, 'Upton LLC', 49, 3, 'Andongsari', 10, 'Dyna', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Butler-Bowdon', 53, 17, 'Dooley-Hackett', 80, 97, 'Orléans', 5, 'Bill', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Olyet', 89, 2, 'Pouros-Kreiger', 21, 96, 'Muarabuliti', 4, 'Theodora', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Stolting', 14, 6, 'Flatley, Reichel and Waelchi', 85, 85, 'Niort', 6, 'Donni', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Layland', 20, 6, 'Pacocha Group', 14, 23, 'Xiangfu', 5, 'Noellyn', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Aubert', 4, 26, 'Lemke, Mante and Bins', 45, 10, 'Banjar Kertasari', 9, 'Eberhard', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Vant', 34, 8, 'Miller, Rodriguez and Monahan', 31, 91, 'Jati', 7, 'Devi', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Hinrich', 39, 7, 'Reynolds-Bode', 96, 96, 'Beidu', 4, 'Peri', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gasperi', 77, 40, 'Emmerich, Hirthe and Harvey', 76, 78, 'Beizi', 5, 'Caritta', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Blanking', 11, 27, 'Wuckert, Hoppe and Osinski', 5, 52, 'Wangbuzhuang', 7, 'Taryn', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Sheers', 35, 13, 'Predovic, Ziemann and Schulist', 38, 74, 'Puzi', 5, 'Glenn', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Roberto', 86, 3, 'Luettgen, Fritsch and Wintheiser', 52, 38, 'Xinhang', 9, 'Kaspar', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Rettie', 42, 31, 'Roob, Hauck and O''Connell', 4, 97, 'Wulipu', 4, 'Karen', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Montel', 21, 28, 'Rice Group', 77, 46, 'Haiyang', 1, 'Christiana', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Chubb', 49, 25, 'Konopelski-Stracke', 66, 46, 'Cabanas de Viriato', 10, 'Wade', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('McLaughlan', 63, 8, 'Wisoky, McDermott and Hagenes', 84, 61, 'Mafra', 3, 'Corry', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Wisher', 89, 27, 'Rohan-Cormier', 11, 28, 'Huangyang', 1, 'Stanislaw', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Durbin', 99, 30, 'Konopelski-Mante', 97, 47, 'Lizhuangzi', 7, 'Otis', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Bauduin', 57, 31, 'Haley-Bernier', 62, 10, 'Yahotyn', 8, 'Lyell', 'Ukraine');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Brend', 59, 18, 'MacGyver-Aufderhar', 46, 70, 'Jiucaizhuang', 2, 'Timmy', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Dore', 14, 11, 'Reinger Inc', 17, 76, 'Cimenga', 9, 'Felicio', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Pikesley', 35, 19, 'Olson Group', 72, 85, 'Subrag', 10, 'Demetria', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Illston', 9, 37, 'Goodwin Inc', 20, 73, 'Chenhu', 1, 'Terence', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Drennan', 89, 31, 'Breitenberg Group', 16, 74, 'Mikrókampos', 1, 'Jocelyne', 'Greece');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Peare', 8, 20, 'Senger, Swaniawski and Labadie', 99, 11, 'Verkhniy Baskunchak', 2, 'Korie', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Warnock', 89, 36, 'Marks LLC', 95, 42, 'Kiuteta', 2, 'Tad', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Hawken', 84, 14, 'Mohr-Reinger', 30, 53, 'Chiri-Yurt', 8, 'Mercedes', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Essel', 46, 24, 'Pacocha, Abbott and Medhurst', 33, 51, 'Athens', 5, 'Jabez', 'Greece');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Bravey', 98, 3, 'Auer-Lindgren', 24, 52, 'Santa Cruz', 8, 'Alena', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Tenant', 13, 5, 'Marvin, Lubowitz and Friesen', 92, 18, 'Lagoa', 10, 'Deerdre', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gensavage', 7, 17, 'Jerde-Halvorson', 66, 34, 'Challans', 2, 'Farrand', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Bartrum', 40, 24, 'Balistreri and Sons', 69, 61, 'Kinel’-Cherkassy', 11, 'Berget', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Dornin', 60, 12, 'Beer-Gleichner', 50, 40, 'Haizhouwobao', 5, 'Neel', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('MacClure', 52, 13, 'Vandervort, Weissnat and Hand', 42, 20, 'Pringsewu', 5, 'Natty', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Poppleston', 76, 17, 'Windler-Kertzmann', 27, 47, 'Paraty', 6, 'Elfie', 'Brazil');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Oblein', 50, 35, 'Hammes, Moen and Stanton', 3, 65, 'Jianxi', 7, 'Briant', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Darree', 56, 7, 'Kovacek, Borer and Dooley', 30, 69, 'Gala', 10, 'Christoper', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Alesi', 80, 2, 'Ruecker-McLaughlin', 75, 62, 'Vetluga', 11, 'Kira', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Colville', 77, 40, 'Lehner LLC', 17, 45, 'Dapo', 3, 'Lincoln', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Chart', 31, 25, 'DuBuque-Mraz', 54, 55, 'Da’ao', 6, 'Odelinda', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gomme', 27, 11, 'Doyle, Carroll and Franecki', 23, 64, 'Limoeiro', 1, 'Lorettalorna', 'Brazil');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Escolme', 93, 30, 'Emmerich, Rau and O''Connell', 33, 99, 'Pantian', 11, 'Leelah', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Omar', 62, 14, 'Klocko-Ernser', 53, 3, 'Aemura', 2, 'Stearn', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Terrelly', 45, 8, 'Altenwerth-Kunde', 2, 16, 'Levallois-Perret', 10, 'Colline', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Hanbidge', 24, 13, 'Volkman-Heidenreich', 77, 3, 'Krasnyy Kholm', 11, 'Germana', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Oliveira', 43, 25, 'Nitzsche Group', 54, 94, 'Gaoyi', 6, 'Ajay', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Cordoba', 97, 27, 'Hackett, Kulas and Stracke', 56, 98, 'Warudoyong', 11, 'Edan', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('McKinney', 88, 9, 'Willms-Barton', 45, 8, 'Chongwen', 1, 'Daveen', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Meric', 48, 3, 'Grant Inc', 92, 21, 'Wangping', 2, 'Robb', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Deware', 38, 24, 'Considine, Volkman and Heidenreich', 22, 15, 'Belanting', 9, 'Den', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Legier', 12, 17, 'Larkin and Sons', 19, 9, 'Yonghe', 4, 'Rita', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('O''Doghesty', 39, 26, 'Murphy-Simonis', 19, 53, 'Pinggang', 4, 'Calvin', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Ballintyne', 47, 37, 'Ferry and Sons', 91, 51, 'Punta de Piedra', 10, 'Leandra', 'Venezuela');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Faucett', 54, 23, 'Klein and Sons', 57, 49, 'Jieshui', 4, 'Micheline', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Tewes', 32, 25, 'Towne-Barton', 26, 90, 'Chernoyerkovskaya', 1, 'Viki', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Fuggles', 13, 27, 'Prohaska Group', 76, 27, 'Maji', 10, 'Humfrid', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Freeborne', 54, 15, 'Terry Group', 56, 95, 'Kalayemule', 1, 'Wilt', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Le Gallo', 37, 6, 'Torp and Sons', 76, 13, 'Yunchi', 8, 'Ninnetta', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Syer', 68, 26, 'Wintheiser Inc', 45, 27, 'Dashiren', 6, 'Leonid', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Mangham', 38, 35, 'Erdman Group', 61, 48, 'Paris 03', 7, 'Enrique', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Otham', 70, 13, 'McLaughlin, Sanford and Boehm', 20, 37, 'El Limon', 7, 'Aurea', 'Mexico');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Babon', 66, 16, 'Boyle Inc', 23, 43, 'Kalumpang', 6, 'Gerick', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Cornick', 71, 21, 'Schowalter LLC', 68, 15, 'Kuanheum', 3, 'Innis', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('McKeever', 95, 38, 'Mertz LLC', 42, 28, 'Kowang Utara', 7, 'Osmond', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Faudrie', 6, 1, 'Schowalter, Yundt and Rogahn', 13, 24, 'Alvito de São Pedro', 1, 'Madelon', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Swafford', 51, 26, 'Medhurst-Batz', 31, 65, 'Baiju', 8, 'Cyb', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Storcke', 51, 7, 'Macejkovic Group', 73, 14, 'Kertai', 1, 'Clemmie', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Ponder', 30, 10, 'Hills, Bartoletti and Zieme', 84, 63, 'Yingshouyingzi', 10, 'Avrom', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Simmill', 83, 33, 'Hintz-Blanda', 37, 26, 'Gorbatovka', 10, 'Torey', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Ellph', 24, 22, 'Hilll Inc', 53, 13, 'Anren Chengguanzhen', 11, 'Robby', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Messom', 87, 8, 'Paucek Group', 29, 81, 'Reshetylivka', 8, 'Cissy', 'Ukraine');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Kemmer', 83, 18, 'Conn-Lynch', 17, 99, 'Santo Antônio de Pádua', 11, 'Herrick', 'Brazil');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Thomassen', 55, 17, 'Yost LLC', 4, 78, 'Linglu', 10, 'Bonni', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Colby', 47, 25, 'Weber LLC', 44, 37, 'Taverny', 5, 'Fania', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Alben', 75, 30, 'Schmitt, Rau and Pouros', 41, 99, 'Tanjiaqiao', 2, 'Gerti', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Ayer', 75, 9, 'Connelly, Prohaska and Konopelski', 73, 24, 'Johogunung', 10, 'Vasili', 'Indonesia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Doggart', 82, 1, 'Lemke Group', 20, 18, 'Cangkreng', 6, 'Grover', 'Mexico');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Trusty', 17, 17, 'Hegmann, Abshire and Morar', 47, 85, 'Qingyuan', 2, 'Agatha', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Yurenin', 10, 8, 'O''Kon and Sons', 92, 26, 'Kayasula', 3, 'Adan', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('MacGilpatrick', 44, 34, 'Schowalter, Nader and Rice', 53, 19, 'Quanjiang', 9, 'Romeo', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Hitscher', 64, 9, 'Goodwin Group', 65, 81, 'Lianshan', 11, 'Garrik', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Kauscher', 1, 25, 'Stokes, Tremblay and Bernier', 19, 7, 'Pombal', 3, 'Jazmin', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Hindmoor', 7, 29, 'Cummings-Berge', 25, 87, 'Rungis', 5, 'Egon', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Hugnin', 40, 29, 'Homenick, Hamill and Konopelski', 36, 64, 'Campo', 6, 'Didi', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Tumielli', 36, 35, 'Harber-Harris', 54, 37, 'Pesqueira', 4, 'Del', 'Brazil');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Kinkead', 43, 23, 'Johnston-Weimann', 81, 93, 'Naikolan', 5, 'Zondra', 'Mexico');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Henke', 94, 11, 'Hagenes-Hegmann', 31, 76, 'Curahnongko', 11, 'Danila', 'Mexico');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('McGebenay', 5, 20, 'Torp Group', 44, 18, 'Aravissós', 11, 'Darryl', 'Greece');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('McGiveen', 22, 22, 'Williamson and Sons', 7, 95, 'Jedung', 11, 'Francesca', 'Mexico');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Kitcher', 18, 20, 'Hilll-Lang', 27, 75, 'Dzhayrakh', 8, 'Dre', 'Russia');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Bromhead', 72, 33, 'Beier, Rau and Flatley', 96, 54, 'Vylkove', 4, 'Sioux', 'Ukraine');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Foulstone', 20, 15, 'Parker and Sons', 40, 92, 'Sungi Liput', 6, 'Linnet', 'Mexico');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Kittman', 10, 33, 'Mohr Inc', 48, 90, 'Creil', 6, 'Lianne', 'France');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Bartelet', 35, 2, 'Bernier, Zulauf and Zulauf', 57, 77, 'Emiliano Zapata', 9, 'Perla', 'Mexico');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Sprankling', 62, 25, 'Yundt and Sons', 35, 3, 'Zhuanshui', 1, 'Nissy', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Phelips', 28, 12, 'Kozey, Hammes and Lindgren', 90, 31, 'Pasirpanjang', 9, 'Jordanna', 'Mexico');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Brunning', 5, 33, 'Torp-Grady', 37, 78, 'Cigenca', 8, 'Terrijo', 'Mexico');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Sturgis', 54, 16, 'Bergstrom LLC', 25, 16, 'Daping', 10, 'Marni', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Dobbs', 87, 15, 'Spinka Inc', 31, 71, 'Akarakar', 1, 'Salomi', 'Mexico');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Colleer', 26, 6, 'Cremin and Sons', 37, 48, 'Mégara', 3, 'Rafaello', 'Greece');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Clemonts', 90, 15, 'Kessler, Wisozk and Walker', 53, 28, 'Mengxi', 3, 'Heddi', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Wogden', 96, 34, 'Shields and Sons', 34, 20, 'Labangka Satu', 5, 'Cindee', 'Mexico');



insert into Orders (OrderID ,ShipAddress, Quantity, TotalPrice, OrderDate) values (1, '08783 Continental Lane', 39, 362.79, '7/4/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (2, '4481 Mitchell Alley', 63, 40.64, '3/6/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (3, '7 Division Court', 45, 71.89, '6/13/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (4, '37 Cherokee Point', 2, 710.99, '3/29/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (5, '5 Surrey Lane', 50, 306.13, '8/25/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (6, '9 Gale Crossing', 14, 417.21, '7/13/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (7, '92 Lerdahl Lane', 87, 669.4, '7/29/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (8, '8 Garrison Lane', 40, 595.48, '3/30/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (9, '6010 David Alley', 26, 132.83, '4/8/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (10,'21 Rutledge Park', 32, 156.16, '5/20/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (11, '49 Eagan Trail', 25, 190.67, '9/4/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (12, '4721 Golf Hill', 44, 834.28, '7/2/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (13, '5184 Red Cloud Drive', 14, 619.62, '1/18/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (14, '28847 Cherokee Terrace', 98, 517.47, '3/15/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (15, '33 Sycamore Junction', 28, 17.7, '6/10/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (16, '32 Sugar Avenue', 55, 163.38, '8/29/2022');
insert into Orders (OrderID, ShipAddress, Quantity, TotalPrice, OrderDate) values (17, '48 Manitowish Court', 100, 401.93, '3/23/2022');

insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('IKbSefZyKQ9n', 'Skyvu', 'Legal Assistant', '195-402-1132', '3793 Esch Crossing', 'Tomilino', '140074', '7/8/2022', 'gmorten0@amazonaws.com', '9/14/2022', 'e8dabc54-8fbd-4c9e-9b5c-54d826a2905b', 'Ginger Morten', 1, 'China');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('6K9ZINoyEz9', 'Meeveo', 'Staff Accountant III', '424-705-9381', '55 Dahle Point', 'Salitral', '10902', '6/5/2022', 'zpusey1@dailymotion.com', '3/15/2022', '728afabb-a9bd-48b6-9818-c2a1d6623a13', 'Zacherie Pusey', 2, 'China');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('EGsMbt', 'Kimia', 'Senior Developer', '564-304-2169', '997 Forest Run Crossing', 'Pakenjeng', "12314", '1/13/2022', 'delms2@twitter.com', '5/5/2022', '853ecea3-329e-4bb8-8784-9700711f6620', 'Devin Elms', 3, 'China');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('qxsi01M', 'Twiyo', 'Help Desk Technician', '593-962-0235', '45727 Brown Center', 'Tumaco', '528539', '1/3/2022', 'gcastaner3@wsj.com', '9/10/2022', '5b83cfed-b753-4c0e-bf04-29c10ad3edd0', 'Giffard Castaner', 4, 'China');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('ZXXIha', 'Yodo', 'Account Representative II', '701-988-2867', '29238 Longview Terrace', 'Nanguzhuang', "1231", '11/4/2022', 'stunesi4@eepurl.com', '6/11/2022', '02e06eff-c784-4c64-8949-5a68009680c4', 'Saba Tunesi', 5, 'China');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('ffgJBzt8', 'Yadel', 'Actuary', '491-996-7125', '684 Muir Court', 'Whitehorse', '75758', '7/22/2022', 'sde5@macromedia.com', '12/18/2021', '46097545-8de3-4ed4-8648-b1804eba45f2', 'Sonni De Vuyst', 6, 'China');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('AuoFcsJZl', 'Roombo', 'Marketing Assistant', '703-478-8861', '579 Duke Plaza', 'El Bolsón', '8430', '7/24/2022', 'akittles6@guardian.co.uk', '9/25/2022', '87d4c4eb-225e-4b7d-be91-a02512eaf47c', 'Adelice Kittles', 7, 'China');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('qeUwVB8A2', 'Oba', 'Help Desk Operator', '412-299-8660', '96668 Sage Pass', 'Liverpool', '58543', '10/6/2022', 'smechi7@cnbc.com', '9/26/2022', '359302f8-6261-42d7-b812-a7578e280926', 'Shawn Mechi', 8, 'China');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('kuABn41i6TEJ', 'Jabberbean', 'Payment Adjustment Coordinator', '642-300-5033', '16848 7th Center', 'Jiantian', "423413", '12/11/2021', 'mkeyser8@earthlink.net', '10/18/2022', '0b5105ce-4fab-4eec-981a-ae76856e31bc', 'Mendel Keyser', 9, 'China');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('mSKR4LasOG8S', 'Centizu', 'Physical Therapy Assistant', '254-644-1940', '5 Mosinee Lane', 'Lyubim', '152470', '11/20/2022', 'mcrebbin9@hhs.gov', '11/2/2022', '48290b9b-2cd0-42ed-adf8-9cb72308d77f', 'Milly Crebbin', 10, 'China');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName) values ('8N21a12Ax7', 'Gabspot', 'Systems Administrator II', '575-399-9116', '1526 Schurz Drive', 'Melaka', '75910', '2/26/2022', 'wmallabona@examiner.com', '5/3/2022', 'b3628a7d-ba56-45f9-b686-2db0387eb7b6', 'Wallie Mallabon', 11, 'China');




insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('4/23/2022', '2bvomn', 'mimesen0@bluehost.com', 'Milt', 'Imesen', '468-244-2973', 'China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('9/12/2022', 'NOy65evKJVfY', 'rbartram1@cmu.edu', 'Rudolfo', 'Bartram', '297-495-7737', 'China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('1/26/2022', 'orViHbfw', 'gsimnel2@cloudflare.com',  'Griffy', 'Simnel', '447-839-6622', 'China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('3/14/2022', 'm2RFPA', 'flethley3@pcworld.com',  'Federica', 'Lethley', '903-860-3765', 'China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('7/18/2022', 'KUseAtc', 'gstorcke4@aboutads.info',  'Giacopo', 'Storcke', '495-902-9567','China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('3/17/2022', 'wqRbCCInj', 'kbonney5@springer.com',  'Kayley', 'Bonney', '418-498-9197', 'China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('11/24/2021', 'OohsWGVHff', 'mjoney6@nih.gov', 'Misty', 'Joney', '373-616-5936', 'China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('8/19/2022', 'An49XYZO2C', 'abrauninger7@admin.ch',  'Annmaria', 'Brauninger', '407-614-8192', 'China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('4/26/2022', 'sEoB1cgdMj7A', 'bduggary8@ezinearticles.com',  'Bertine', 'Duggary', '514-395-9994', 'China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('9/16/2022', 'kutB5S3b', 'nsherburn9@jigsy.com',  'Nara', 'Sherburn', '220-616-2562', 'China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('3/16/2022', '3jG1iEwcXjdU', 'phutfielda@cbsnews.com',  'Penn', 'Hutfield', '172-144-8745','China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('4/9/2022', '98isn35ZL', 'rcastelletb@booking.com',  'Rochester', 'Castellet', '172-521-3391','China');
insert into Customer (DateJoined, Password, Email, FirstName, LastName, Phone, CountryName) values ('6/5/2022', 'LFGM0bor', 'ltriplowc@de.vu',  'Lesly', 'Triplow', '977-433-6513', 'China');

insert into Ordered (OrderID, CostumerID) values (1, 1);
insert into Ordered (OrderID, CostumerID) values (2, 2);
insert into Ordered (OrderID, CostumerID) values (3, 3);
insert into Ordered (OrderID, CostumerID) values (4, 1);
insert into Ordered (OrderID, CostumerID) values (5, 1);
insert into Ordered (OrderID, CostumerID) values (6, 1);
insert into Ordered (OrderID, CostumerID) values (7, 1);
insert into Ordered (OrderID, CostumerID) values (8, 1);
insert into Ordered (OrderID, CostumerID) values (9, 1);
insert into Ordered (OrderID, CostumerID) values (10,1);
insert into Ordered (OrderID, CostumerID) values (11,1);
insert into Ordered (OrderID, CostumerID) values (12,1);
insert into Ordered (OrderID, CostumerID) values (13,1);
insert into Ordered (OrderID, CostumerID) values (14, 1);
insert into Ordered (OrderID, CostumerID) values (15, 1);
insert into Ordered (OrderID, CostumerID) values (16, 1);
insert into Ordered (OrderID, CostumerID) values (17, 1);
