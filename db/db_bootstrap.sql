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
  ShipAddress VARCHAR(20) NOT NULL,
  Quantity INT NOT NULL,
  TotalPrice INT NOT NULL,
  OrderDate DATE NOT NULL,
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
  CountryID VARCHAR(50),
  PRIMARY KEY (JerseyNum),
  FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

CREATE TABLE AlbumCompany
(
  Password VARCHAR(20) NOT NULL,
  CompanyName VARCHAR(20) NOT NULL,
  ContactTitle VARCHAR(20) NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  Address VARCHAR(20) NOT NULL,
  City VARCHAR(20) NOT NULL,
  PostalCode INT NOT NULL,
  LastLogin VARCHAR(20) NOT NULL,
  Email VARCHAR(40) NOT NULL,
  DateJoined VARCHAR(20) NOT NULL,
  CompanyID VARCHAR(40) NOT NULL,
  ContactName VARCHAR(20) NOT NULL,
  OrderID INT NOT NULL,
  CountryID VARCHAR(50),
  PRIMARY KEY (CompanyID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (CountryID) REFERENCES Country(CountryID),
  UNIQUE (Email)
);

CREATE TABLE Customer
(
  DateJoined DATE NOT NULL,
  Password VARCHAR(20) NOT NULL,
  Email VARCHAR(20) NOT NULL,
  CostumerID INT NOT NULL,
  FirstName VARCHAR(20) NOT NULL,
  LastName VARCHAR(20) NOT NULL,
  Phone VARCHAR(40) NOT NULL,
  CountryID VARCHAR(50),
  PRIMARY KEY (CostumerID),
  FOREIGN KEY (CountryID) REFERENCES Country(CountryID),
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


insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Gladbach', 25, 25, 'Devshare', 74, 93, 'Sŏnbong', 11, 'Isabelle');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Still', 24, 26, 'Browseblab', 23, 36, 'Qidi', 5, 'Linn');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Kuzma', 35, 21, 'Roodel', 46, 43, 'Ibara', 7, 'Cassandre');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Tiffney', 19, 21, 'Dynabox', 63, 36, 'Triánta', 8, 'Fowler');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Latore', 11, 30, 'Yozio', 28, 69, 'Santo Antônio do Monte', 7, 'Maudie');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Landman', 33, 21, 'Tagfeed', 8, 65, 'Sangke', 3, 'Gerti');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Neasam', 34, 24, 'Vimbo', 19, 85, 'Shalang', 4, 'Johnath');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Godsal', 6, 23, 'Ailane', 78, 7, 'Ferreiros', 9, 'Shalne');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Gerrelt', 23, 19, 'Cogilith', 44, 34, 'Matiao', 2, 'Sib');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Huerta', 29, 29, 'Lazz', 34, 65, 'Vievis', 8, 'Harman');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Deverick', 18, 26, 'Vipe', 83, 34, 'Katsina-Ala', 7, 'Wenonah');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Chasney', 39, 29, 'Mycat', 45, 7, 'Anadia', 1, 'Patsy');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Redan', 26, 18, 'Fivebridge', 60, 22, 'Wangdian', 8, 'Urban');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Izatt', 13, 19, 'Jayo', 1, 12, 'Clarines', 5, 'Maureene');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Rydings', 36, 27, 'Reallinks', 64, 1, 'Cincinnati', 6, 'Goldie');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Draycott', 77, 18, 'Kanoodle', 14, 30, 'Santa Rita Village', 11, 'Ilysa');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Joynt', 16, 23, 'Blogtag', 76, 28, 'Arlington', 9, 'Silvanus');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Elfleet', 22, 22, 'Kwideo', 5, 62, 'Mlonggo', 4, 'Dolly');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Popplewell', 3, 28, 'Yakidoo', 72, 24, 'La Sabana', 7, 'Keith');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Northall', 88, 25, 'Shuffletag', 59, 64, 'Novhorod-Sivers’kyy', 9, 'Jerrold');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Kittiman', 17, 21, 'Twimm', 23, 58, 'Grand Rapids', 1, 'Othello');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Duffit', 99, 27, 'Ooba', 25, 10, 'Diên Khánh', 3, 'Sherrie');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Burger', 8, 27, 'Jaxspan', 53, 39, 'Novyye Cherëmushki', 5, 'Ingaberg');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Mougenel', 21, 27, 'Zoomzone', 94, 68, 'Sugihwaras', 4, 'Bondy');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Daveren', 7, 18, 'Blognation', 86, 93, 'Chandmanĭ', 7, 'Billie');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Gerrans', 9, 26, 'Jaxbean', 70, 87, 'Abaza', 11, 'Cyndy');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Crim', 1, 18, 'Blogtag', 32, 82, 'Yinglan', 3, 'Gerome');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Seager', 2, 29, 'Tanoodle', 29, 75, 'Gustavsberg', 4, 'Silva');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Challes', 4, 26, 'Yakijo', 86, 24, 'Sergelen', 3, 'Kanya');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Huff', 10, 19, 'Mydeo', 17, 81, 'Bera', 5, 'Moishe');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Hover', 14, 30, 'Tavu', 27, 68, 'Yaosai', 2, 'Darn');
insert into Player (LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName) values ('Chippendale', 12, 28, 'Skinte', 3, 55, 'Novovolyns’k', 1, 'Denys');

insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('IKbSefZyKQ9n', 'Skyvu', 'Legal Assistant', '195-402-1132', '3793 Esch Crossing', 'Tomilino', '140074', '7/8/2022', 'gmorten0@amazonaws.com', '9/14/2022', 'e8dabc54-8fbd-4c9e-9b5c-54d826a2905b', 'Ginger Morten', '1d8e65a5-8aba-4d7f-a1a1-21a5b6ec7cf1', 'ZA');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('6K9ZINoyEz9', 'Meeveo', 'Staff Accountant III', '424-705-9381', '55 Dahle Point', 'Salitral', '10902', '6/5/2022', 'zpusey1@dailymotion.com', '3/15/2022', '728afabb-a9bd-48b6-9818-c2a1d6623a13', 'Zacherie Pusey', 'd2ba901e-21ac-4568-af0f-7fc766961e9c', 'US');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('EGsMbt', 'Kimia', 'Senior Developer', '564-304-2169', '997 Forest Run Crossing', 'Pakenjeng', null, '1/13/2022', 'delms2@twitter.com', '5/5/2022', '853ecea3-329e-4bb8-8784-9700711f6620', 'Devin Elms', '825ee117-11a1-4ceb-9bbc-d932f803bda5', 'US');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('qxsi01M', 'Twiyo', 'Help Desk Technician', '593-962-0235', '45727 Brown Center', 'Tumaco', '528539', '1/3/2022', 'gcastaner3@wsj.com', '9/10/2022', '5b83cfed-b753-4c0e-bf04-29c10ad3edd0', 'Giffard Castaner', '313f6a3a-8858-4fad-b725-081d9ec228c0', 'FR');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('ZXXIha', 'Yodo', 'Account Representative II', '701-988-2867', '29238 Longview Terrace', 'Nanguzhuang', null, '11/4/2022', 'stunesi4@eepurl.com', '6/11/2022', '02e06eff-c784-4c64-8949-5a68009680c4', 'Saba Tunesi', '6703bbbd-28af-459b-a9bb-93362f1c698c', 'ID');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('ffgJBzt8', 'Yadel', 'Actuary', '491-996-7125', '684 Muir Court', 'Whitehorse', 'Y1A', '7/22/2022', 'sde5@macromedia.com', '12/18/2021', '46097545-8de3-4ed4-8648-b1804eba45f2', 'Sonni De Vuyst', '16519c52-1dee-41f7-a182-af9e6a607c3a', 'PY');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('AuoFcsJZl', 'Roombo', 'Marketing Assistant', '703-478-8861', '579 Duke Plaza', 'El Bolsón', '8430', '7/24/2022', 'akittles6@guardian.co.uk', '9/25/2022', '87d4c4eb-225e-4b7d-be91-a02512eaf47c', 'Adelice Kittles', 'cd20194e-f2aa-4565-90ac-d56530bcacaa', 'SA');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('qeUwVB8A2', 'Oba', 'Help Desk Operator', '412-299-8660', '96668 Sage Pass', 'Liverpool', 'L74', '10/6/2022', 'smechi7@cnbc.com', '9/26/2022', '359302f8-6261-42d7-b812-a7578e280926', 'Shawn Mechi', 'ab28a2e0-a0a2-457d-b213-ed705412c7e0', 'PE');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('kuABn41i6TEJ', 'Jabberbean', 'Payment Adjustment Coordinator', '642-300-5033', '16848 7th Center', 'Jiantian', null, '12/11/2021', 'mkeyser8@earthlink.net', '10/18/2022', '0b5105ce-4fab-4eec-981a-ae76856e31bc', 'Mendel Keyser', 'ace1ca7d-12eb-412e-b88f-6b521fefd624', 'RU');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('mSKR4LasOG8S', 'Centizu', 'Physical Therapy Assistant', '254-644-1940', '5 Mosinee Lane', 'Lyubim', '152470', '11/20/2022', 'mcrebbin9@hhs.gov', '11/2/2022', '48290b9b-2cd0-42ed-adf8-9cb72308d77f', 'Milly Crebbin', '697abe55-29e9-4229-847e-c649e9cb80b7', 'US');
insert into AlbumCompany (Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryID) values ('8N21a12Ax7', 'Gabspot', 'Systems Administrator II', '575-399-9116', '1526 Schurz Drive', 'Melaka', '75910', '2/26/2022', 'wmallabona@examiner.com', '5/3/2022', 'b3628a7d-ba56-45f9-b686-2db0387eb7b6', 'Wallie Mallabon', 'fa825fdb-ac8e-4f6c-a875-321aa9bd26b6', 'CL');

insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('08783 Continental Lane', 39, 362.79, '7/4/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('4481 Mitchell Alley', 63, 40.64, '3/6/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('7 Division Court', 45, 71.89, '6/13/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('37 Cherokee Point', 2, 710.99, '3/29/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('5 Surrey Lane', 50, 306.13, '8/25/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('9 Gale Crossing', 14, 417.21, '7/13/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('92 Lerdahl Lane', 87, 669.4, '7/29/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('8 Garrison Lane', 40, 595.48, '3/30/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('6010 David Alley', 26, 132.83, '4/8/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('21 Rutledge Park', 32, 156.16, '5/20/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('49 Eagan Trail', 25, 190.67, '9/4/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('4721 Golf Hill', 44, 834.28, '7/2/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('5184 Red Cloud Drive', 14, 619.62, '1/18/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('28847 Cherokee Terrace', 98, 517.47, '3/15/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('33 Sycamore Junction', 28, 17.7, '6/10/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('32 Sugar Avenue', 55, 163.38, '8/29/2022');
insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate) values ('48 Manitowish Court', 100, 401.93, '3/23/2022');


insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('4/23/2022', '2bvomn', 'mimesen0@bluehost.com', '3d9c7226-3003-4115-a93c-9f5e5c12b96b', 'Milt', 'Imesen', '468-244-2973', '03f84b7f-7e98-482b-b60e-a8d40e0b4a9b');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('9/12/2022', 'NOy65evKJVfY', 'rbartram1@cmu.edu', '250738ee-9a89-456a-9e33-4f57f1882bdc', 'Rudolfo', 'Bartram', '297-495-7737', '5f29aba2-abe2-49fb-8e66-ea18077864f7');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('1/26/2022', 'orViHbfw', 'gsimnel2@cloudflare.com', 'b2dbf192-b163-4dd6-9156-9fb51c0dca69', 'Griffy', 'Simnel', '447-839-6622', '5766c30c-a517-4a60-83c6-7a1609dd4c59');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('3/14/2022', 'm2RFPA', 'flethley3@pcworld.com', 'b6ea97cb-6849-432c-8ad9-d20f9b5cdb2d', 'Federica', 'Lethley', '903-860-3765', '76d0b0e4-2f30-44a3-acbc-ad3d31a9258f');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('7/18/2022', 'KUseAtc', 'gstorcke4@aboutads.info', '385fb687-6dc5-4c38-ab79-30d438eab2b7', 'Giacopo', 'Storcke', '495-902-9567', 'e7f15861-c3b8-4851-b5d6-2dbe05f26d1a');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('3/17/2022', 'wqRbCCInj', 'kbonney5@springer.com', 'e649a765-f4eb-430f-bf4b-38ec4e81a899', 'Kayley', 'Bonney', '418-498-9197', 'c1307b62-d448-4fea-ab84-594dfacf71e6');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('11/24/2021', 'OohsWGVHff', 'mjoney6@nih.gov', 'b212c709-5b33-4f8e-8e22-0ac02798ab5f', 'Misty', 'Joney', '373-616-5936', '169d35de-dd97-4ff9-8b91-792c4c000bdb');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('8/19/2022', 'An49XYZO2C', 'abrauninger7@admin.ch', '1cdecf29-0f65-4cee-872d-39e96c0f121c', 'Annmaria', 'Brauninger', '407-614-8192', '97461980-bbf9-4f43-8179-9e8aa318f71f');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('4/26/2022', 'sEoB1cgdMj7A', 'bduggary8@ezinearticles.com', 'f8bc1fac-55c2-48fc-92b4-9abebb73bf7c', 'Bertine', 'Duggary', '514-395-9994', 'c8e175c1-c217-4092-b708-7cfe0e21bc5a');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('9/16/2022', 'kutB5S3b', 'nsherburn9@jigsy.com', '45b1a072-fb18-45f0-811f-db1d1df17d2f', 'Nara', 'Sherburn', '220-616-2562', '3a89b463-b055-4ce8-a80c-8c74d26829ff');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('3/16/2022', '3jG1iEwcXjdU', 'phutfielda@cbsnews.com', 'ba7ca362-a740-43d5-a2c8-ee886e4a34f7', 'Penn', 'Hutfield', '172-144-8745', '6d00b2be-70f3-4ec2-b403-6bab327a25c3');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('4/9/2022', '98isn35ZL', 'rcastelletb@booking.com', '09f88764-9ddc-496b-8152-434151c67222', 'Rochester', 'Castellet', '172-521-3391', 'b2e70aaf-abd5-4a10-8496-c96e5d3dcd30');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('6/5/2022', 'LFGM0bor', 'ltriplowc@de.vu', 'abb979cb-c576-4e37-9252-1680ddaed3b0', 'Lesly', 'Triplow', '977-433-6513', '8e14aa0a-5d57-4e9d-bb12-e7f405a09fdd');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('8/23/2022', 'gwiQJs2X', 'etremmeld@163.com', '8d3588b8-0cf8-4798-a565-4a7ccec5ebeb', 'Everard', 'Tremmel', '184-103-2178', '17461254-ee71-4d99-9a58-f9479e6e071c');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('8/3/2022', 'G1Jq8umVXCP', 'arudrame@bloglovin.com', '0c6beaa5-cc30-4406-8504-50f5333afbf3', 'Ashlin', 'Rudram', '434-871-2389', 'e6bf01fa-4e00-4224-b71b-d6886501430c');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('5/21/2022', '2Umj0Ze', 'ntesseymanf@cbc.ca', 'ab986f5d-92f7-414d-9102-e76583af2af1', 'Nertie', 'Tesseyman', '254-241-6796', 'b36d686f-a2da-4b0b-af9a-1a42761fda00');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('4/1/2022', '3d8x2Ggig', 'yrolandg@blog.com', 'c9b64c40-ee64-4a19-8855-b348780dafa9', 'Yolanda', 'Roland', '698-200-6188', 'be1241ee-c9ac-45b5-99b1-170a0afa9aab');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('10/30/2022', 'l2i5Tjj', 'dbowenh@ask.com', '10aea9a2-8aec-4b05-9f95-89a8972106a6', 'Devon', 'Bowen', '338-295-7723', 'dd05c029-8c80-4e59-b511-24eebd1bccbe');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('10/17/2022', 'f7JqnCre1DbO', 'fkennifecki@independent.co.uk', '8969235c-b731-48e6-95e7-4ad311df1893', 'Ferris', 'Kennifeck', '309-958-8353', 'f5c1745a-604d-49eb-8c3d-e9126d386163');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('12/17/2021', 'nuwh2D', 'pbrattenj@lulu.com', '17c1c7f4-766c-4920-b3e1-96a19a9f73fa', 'Petronia', 'Bratten', '920-232-4603', 'd516c9e8-8342-44b1-a846-7d3c134b529b');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('11/6/2022', 'q9sYYtklz', 'tgysek@whitehouse.gov', 'd738e535-5555-4b3e-b4fb-cd65ffcdd467', 'Tatiana', 'Gyse', '840-124-9718', 'e49b2bca-bd01-4ff5-a756-401c1b82b230');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('3/21/2022', 'q4oG0mBuVC', 'bwanderschekl@moonfruit.com', 'ce008b84-0cc2-4799-b10e-01c06bdd5f5b', 'Brion', 'Wanderschek', '954-625-7082', 'ae6c75e6-4db1-40ce-9cde-ce8bbe2e0084');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('3/6/2022', 'GrHusoXT', 'tcasalem@gizmodo.com', '41ffccf3-1af2-4e64-8c88-30eb2eae9168', 'Titos', 'Casale', '255-756-8809', '36ff13ab-2cfa-4b58-93de-6918ba5b413d');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('4/7/2022', '2lTVvJ', 'sbenfelln@yelp.com', 'c5324e80-434f-4bc8-9fd0-8fa8e6a8d378', 'Seka', 'Benfell', '748-375-3365', '924ed484-4ca0-413f-97bf-bd6184e5f52a');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('11/23/2021', 'ZuirCb6gBgd', 'pwhitlocko@ibm.com', '8bacdd52-ce1e-4166-8eff-268024c33165', 'Pall', 'Whitlock', '912-948-6536', 'a15daf01-43c3-4139-a794-67a4dd34cddb');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('7/6/2022', 'ih8S165z0', 'sschustp@surveymonkey.com', '32632214-3652-4e38-9a2d-b5ff3537c68b', 'Skipton', 'Schust', '921-390-2663', '14c60758-b8c7-4b6d-adc9-13661852e5b4');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('2/16/2022', 'nXOBdMf', 'fellsq@ft.com', '91e7e765-8f2e-4f50-8fbe-495eaeafa422', 'Filbert', 'Ells', '888-265-3575', 'bcfa6d13-9d31-4b5c-ac60-fb8b71e97e2b');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('8/29/2022', 'B1eSpfAnezFT', 'lspratleyr@gmpg.org', 'e9e38ddb-a830-4055-80c6-f5c3895488e1', 'Laureen', 'Spratley', '416-241-2601', 'ba0e6ff7-0e17-4b35-8bb9-503a8023a7b5');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('4/11/2022', 'mT9cWB5mx', 'cfogdens@rakuten.co.jp', '0cddd968-22fe-4ef1-b87e-266103856ad2', 'Charmaine', 'Fogden', '670-949-6811', 'a8d4de04-7d68-4847-a6f0-b314feeae724');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('1/8/2022', 'Ny9hSLbyCJI', 'gwhimpennyt@weebly.com', '978cb041-0c68-4c80-be3d-a92ad1835830', 'Gui', 'Whimpenny', '319-586-9601', 'f3beb0bb-88e1-40f8-a01d-be5ba8f739da');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('7/31/2022', '9ZoL93G92B', 'btilliardu@delicious.com', '2750d90f-b547-4792-96a5-c72777de5d92', 'Barb', 'Tilliard', '836-661-7737', 'a0f58a22-9793-4642-946d-cae042e4eb3f');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('8/24/2022', 'LWy5UOhv', 'sranaghanv@cornell.edu', '4297e59f-157d-4529-a8ca-2ae460405829', 'Suzi', 'Ranaghan', '459-747-9629', '9dafea3b-0b11-474d-887b-bd13100d10ef');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('7/14/2022', 'jjFEnkS', 'eculpenw@bloglines.com', '4fac4a12-853e-4cf5-9e0f-9ba83cc672fe', 'Edsel', 'Culpen', '853-237-3927', '0892923d-945c-40cd-aabf-0b0615685ecc');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('3/18/2022', 'ZbZKXZ4kH', 'nprex@howstuffworks.com', '9d06630a-7b8b-4815-971d-052a9cf6e6da', 'Nolana', 'Pre', '169-236-8086', 'c1f357bf-a592-431e-8f6b-8979690d7cb5');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('7/19/2022', 'iymZUypfUL', 'alathwoody@ow.ly', '4687e64d-59c4-4269-9101-121c9f6ed65d', 'Ana', 'Lathwood', '254-709-8168', 'ab1ce902-0f68-4120-af41-b22cc2d626d5');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('7/11/2022', 'rkmFp8kZk', 'broserz@about.me', '00739844-8051-4fd3-84d8-a153be9063c4', 'Bobby', 'Roser', '483-775-4657', 'ad959d3e-81c7-49b6-9617-219b9ac1f93e');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('5/8/2022', 'BzCA1GFkk8', 'jflawn10@issuu.com', '8fee8bd3-b8e1-4056-88fc-580fd373129c', 'Jacquenette', 'Flawn', '821-497-9446', '46ab7ead-bdb4-44e7-b969-61ca482cf671');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('2/19/2022', 'B3mCMhv3u', 'vabel11@narod.ru', 'f639c569-4503-4fae-a272-b243094dc251', 'Vernor', 'Abel', '228-523-2815', '3359a038-f366-4fd1-9793-e242c3c9d028');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('6/2/2022', 'LYgEHy', 'mmcgeoch12@paginegialle.it', '582b5228-2f8a-4178-87a8-b0b71b87bff7', 'Milty', 'McGeoch', '850-776-6802', '25ffc8f3-a440-4bb8-bfed-cca759e825a4');
insert into Customer (DateJoined, Password, Email, CostumerID, FirstName, LastName, Phone, CountryID) values ('3/13/2022', 'YDG4hXZ', 'dedlin13@tripadvisor.com', 'f10e6485-1546-45d7-9eec-25bfcabe15db', 'Dillie', 'Edlin', '621-262-3450', '74c24228-762b-4661-b92a-839698116fa1');

insert into Ordered (OrderID, CostumerID) values ('544afd3b-075a-4542-a61d-1958f75b7def', '4ae7f1f7-805b-4767-9400-63f901d0eb7c');
insert into Ordered (OrderID, CostumerID) values ('225277e2-d24b-49ac-9d04-58e03eed0ff8', '509b069f-5c2f-4094-b131-1d1497c8fcff');
insert into Ordered (OrderID, CostumerID) values ('9a15e1b8-6449-4588-963b-63dd50a4563d', '27000901-b9ea-4f97-bd93-fe99bf0dc265');
insert into Ordered (OrderID, CostumerID) values ('48c3decd-3abd-4b2c-bd76-aba5048d2355', '013a4502-b94f-41b3-a35e-04f5571f335d');
insert into Ordered (OrderID, CostumerID) values ('7ca1b457-518f-4506-bea4-dd0652f3acf7', '8256a1a1-bcca-4f9e-b9b0-09f8b48974ad');
insert into Ordered (OrderID, CostumerID) values ('4ca31270-e80a-486c-b45f-085cffc4d0aa', 'a639bbec-fe3a-4e72-b434-a7f81102cdc7');
insert into Ordered (OrderID, CostumerID) values ('ec984bbc-c0b2-42e3-a4b3-a19e1ca4d84b', 'e5218d34-9245-498f-988b-d8554bbe0ffd');
insert into Ordered (OrderID, CostumerID) values ('d57796e1-a840-43e5-9109-da9ad3fce72b', '2e572822-2a00-4bcc-8288-13568969edca');
insert into Ordered (OrderID, CostumerID) values ('3aea6812-2bfe-4e49-9554-7b042277017b', 'bec6849d-0d14-46fe-9eaf-f07e8021d5ea');
insert into Ordered (OrderID, CostumerID) values ('cc2eff0c-ed80-4f02-b9cb-25a582114929', '9d650018-1557-45a3-97d3-76397fb3d107');
insert into Ordered (OrderID, CostumerID) values ('6ff7f206-f029-4592-a9b7-115874b41aee', 'd9eeca7e-5209-453a-a0ce-71604e063973');
insert into Ordered (OrderID, CostumerID) values ('a9a3c374-e780-49d7-8adf-5bb839842591', '500a49b8-0a11-43da-87ad-36fda22e8d1a');
insert into Ordered (OrderID, CostumerID) values ('234de617-bed0-4e06-8209-ef99ae21ee70', '3b407951-7c7b-400c-866c-3fd0ae2bbcba');
insert into Ordered (OrderID, CostumerID) values ('aaa48807-81ef-49cd-a406-73dfc71b78ba', '37dc7dd2-79f2-4134-964f-ad75a25558f5');
insert into Ordered (OrderID, CostumerID) values ('69b63329-8691-46cb-8544-a93fd13078c7', '20b5d5a6-9df4-4383-ae9e-3344ea2dafc4');
insert into Ordered (OrderID, CostumerID) values ('3b9a0a66-e931-45aa-8e50-ebf72fd0ea4f', '1c322a46-b8f4-41a3-a70a-98a9ca98df4b');
insert into Ordered (OrderID, CostumerID) values ('cf14f202-7b1a-4051-966b-96b86121dab9', 'eaab0258-c6d4-490d-a790-c3ac352561a7');
insert into Ordered (OrderID, CostumerID) values ('27a93408-a77a-4240-9b3b-00f2598daa1b', '7a917c7a-885f-4a45-a0c9-6d977d4d81f1');
insert into Ordered (OrderID, CostumerID) values ('52de1bb2-8887-4a24-b064-e0c79ad64f88', 'b8894122-d4be-4a81-b40b-b1917efa8512');
insert into Ordered (OrderID, CostumerID) values ('a1d96544-d55b-4ed6-acc0-60b528663c6f', 'ce755359-d61b-48da-9490-c6e46d4aefb7');
insert into Ordered (OrderID, CostumerID) values ('689caf76-35e9-403e-90d0-f9fd6d557636', '22d4575d-42c7-4623-a1fd-01ab1c5c89e6');
insert into Ordered (OrderID, CostumerID) values ('185590e7-aa01-4cc3-a183-9af21a4e6717', '194cc876-e1cc-4169-969a-b6115d287fc0');
insert into Ordered (OrderID, CostumerID) values ('9ee8656c-c32a-46dd-8487-ea6e843e8f62', 'db85ba14-1e38-4c2a-ba3b-1035c8ca630e');
insert into Ordered (OrderID, CostumerID) values ('3e7aeabb-09ed-4c86-b4a8-306805eb3ec5', '9a913fcc-40c5-4b00-9bde-158cc6eb012b');
insert into Ordered (OrderID, CostumerID) values ('06854a4e-2a44-490a-9d8c-b26c8e375df7', 'c4fa70c9-8e39-40d1-b4ee-c200f1a36510');
insert into Ordered (OrderID, CostumerID) values ('e3513758-7ead-4f86-81cb-dc058620e8f0', 'ec572851-a287-4d48-9b44-eaebf68f0ca5');
insert into Ordered (OrderID, CostumerID) values ('4532fb46-8be7-4379-9246-bd20bd708730', '6a2c2e1a-6c8d-4723-b9d1-acd4fe65eebe');
insert into Ordered (OrderID, CostumerID) values ('043561cc-38e0-4341-9d2f-daa22e739588', '94519d15-2b35-419e-b718-780f7dfecc9c');
insert into Ordered (OrderID, CostumerID) values ('b907d912-7d3e-4d34-9923-5091731dba71', '14180a84-a491-45df-8d5a-befac8ab3b0d');
insert into Ordered (OrderID, CostumerID) values ('5f87ff65-eeb1-4fad-b710-6421c24ccfa6', 'ef59a988-d13c-4d4e-964f-7435502d4461');
insert into Ordered (OrderID, CostumerID) values ('29558698-ee94-4e66-9a32-088b81fd6614', '53d0bb1e-6f32-4cc7-b2b2-d90fd5e7b4b9');
insert into Ordered (OrderID, CostumerID) values ('ab1b29d3-1937-4500-9d88-08e31be7662d', '330de9fd-d7d1-45dc-999d-c67f43ea0c84');
insert into Ordered (OrderID, CostumerID) values ('9bfd15bd-115b-4331-b86d-6a1f083824c8', 'b50d6ff3-4ab0-47a3-8c49-ce5758f4760d');
insert into Ordered (OrderID, CostumerID) values ('4f074c38-0f0f-456f-b826-5d3d9d202951', '074ada2e-16f9-49de-8fc2-975947ab5e7b');
insert into Ordered (OrderID, CostumerID) values ('69edb82a-a413-4477-93a1-d1b697474027', '2fd3d609-f4f0-41e3-b444-b8d57415ce2e');
insert into Ordered (OrderID, CostumerID) values ('37fbbad1-130e-4c7e-ba2c-477d5e3a6a22', 'd670692d-0d37-4944-944a-b5bb21a079ff');
insert into Ordered (OrderID, CostumerID) values ('dba4605a-6c7d-4515-a17d-c6b468f21191', '78f1f95d-98ca-4bd1-9ee9-bc5109b51112');
insert into Ordered (OrderID, CostumerID) values ('1637a616-62ed-4c7a-87f5-b58486cd7d6e', 'c1cc751b-3b72-4494-90d1-0fbb450124e8');
insert into Ordered (OrderID, CostumerID) values ('397d86a6-2d57-4705-8808-70ef05939509', '57b77520-11a5-406a-ae8e-9e9d39ab19f0');
insert into Ordered (OrderID, CostumerID) values ('025bae6e-ebdc-4470-a95c-ab30d2d87f68', 'a3cf4880-2a42-4b9f-b778-e39a5914add9');