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
  CountryName VARCHAR(20) NOT NULL,
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
  ClubTeam VARCHAR(20) NOT NULL,
  CareerGoals INT NOT NULL,
  CareerAssists INT NOT NULL,
  CityOfBirth VARCHAR(40) NOT NULL,
  Position VARCHAR(20) NOT NULL,
  FirstName VARCHAR(20) NOT NULL,
  CountryName VARCHAR(50),
  PRIMARY KEY (JerseyNum),
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
  CostumerID INT NOT NULL  AUTO_INCREMENT,
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


insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gladbach', 25, 25, 'Devshare', 74, 93, 'Sŏnbong', 11, 'Isabelle', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Still', 24, 26, 'Browseblab', 23, 36, 'Qidi', 5, 'Linn', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Kuzma', 35, 21, 'Roodel', 46, 43, 'Ibara', 7, 'Cassandre', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Tiffney', 19, 21, 'Dynabox', 63, 36, 'Triánta', 8, 'Fowler', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Latore', 11, 30, 'Yozio', 28, 69, 'Santo Antônio do Monte', 7, 'Maudie', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Landman', 33, 21, 'Tagfeed', 8, 65, 'Sangke', 3, 'Gerti', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Neasam', 34, 24, 'Vimbo', 19, 85, 'Shalang', 4, 'Johnath', 'Portugal');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Godsal', 6, 23, 'Ailane', 78, 7, 'Ferreiros', 9, 'Shalne', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gerrelt', 23, 19, 'Cogilith', 44, 34, 'Matiao', 2, 'Sib', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Huerta', 29, 29, 'Lazz', 34, 65, 'Vievis', 8, 'Harman', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Deverick', 18, 26, 'Vipe', 83, 34, 'Katsina-Ala', 7, 'Wenonah', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Chasney', 39, 29, 'Mycat', 45, 7, 'Anadia', 1, 'Patsy', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Redan', 26, 18, 'Fivebridge', 60, 22, 'Wangdian', 8, 'Urban', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Izatt', 13, 19, 'Jayo', 1, 12, 'Clarines', 5, 'Maureene', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Rydings', 36, 27, 'Reallinks', 64, 1, 'Cincinnati', 6, 'Goldie', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Draycott', 77, 18, 'Kanoodle', 14, 30, 'Santa Rita Village', 11, 'Ilysa', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Joynt', 16, 23, 'Blogtag', 76, 28, 'Arlington', 9, 'Silvanus', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Elfleet', 22, 22, 'Kwideo', 5, 62, 'Mlonggo', 4, 'Dolly', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Popplewell', 3, 28, 'Yakidoo', 72, 24, 'La Sabana', 7, 'Keith', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Northall', 88, 25, 'Shuffletag', 59, 64, 'Novhorod-Sivers’kyy', 9, 'Jerrold', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Kittiman', 17, 21, 'Twimm', 23, 58, 'Grand Rapids', 1, 'Othello', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Duffit', 99, 27, 'Ooba', 25, 10, 'Diên Khánh', 3, 'Sherrie', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Burger', 8, 27, 'Jaxspan', 53, 39, 'Novyye Cherëmushki', 5, 'Ingaberg', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Mougenel', 21, 27, 'Zoomzone', 94, 68, 'Sugihwaras', 4, 'Bondy', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Daveren', 7, 18, 'Blognation', 86, 93, 'Chandmanĭ', 7, 'Billie', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Gerrans', 9, 26, 'Jaxbean', 70, 87, 'Abaza', 11, 'Cyndy', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Crim', 1, 18, 'Blogtag', 32, 82, 'Yinglan', 3, 'Gerome', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Seager', 2, 29, 'Tanoodle', 29, 75, 'Gustavsberg', 4, 'Silva', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Challes', 4, 26, 'Yakijo', 86, 24, 'Sergelen', 3, 'Kanya', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Huff', 10, 19, 'Mydeo', 17, 81, 'Bera', 5, 'Moishe', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Hover', 14, 30, 'Tavu', 27, 68, 'Yaosai', 2, 'Darn', 'China');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName) values ('Chippendale', 12, 28, 'Skinte', 3, 55, 'Novovolyns’k', 1, 'Denys', 'China');


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
