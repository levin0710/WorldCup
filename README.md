This repo contains the different sources that are used in conjunction with
AppSmith to create a World Cup application. 

To begin, the db folder contains a bootstrap sql file named db_bootstrap.sql
which contains the sql of all the different tables and attributes of each table. Here are the following tables and attributes:

- Orders: OrderID, ShipAddress, Quantity, TotalPrice, OrderDate
- Confederation: ConfederationID, Continent
- Group Table: GroupLetter 
- Country: CountryID, Ranking, CountryName, LastChampionshipDate, Email, Password, LastLogin, DateJoined, NumberOfCups, Coach, ConfederationID, GroupLetter
- Player: LastName, JerseyNum, Age, ClubTeam, CareerGoals, CareerAssists, CityOfBirth, Position, FirstName, CountryName, PlayerID 
- AlbumCompany: Password, CompanyName, ContactTitle, Phone, Address, City, PostalCode, LastLogin, Email, DateJoined, CompanyID, ContactName, OrderID, CountryName
- Customer: DateJoined, Passowrd, Email, CostumerID, FirstName, LastName, Phone, CountryName
- Ordered: OrderID, CostumerID

Each table includes a primary key and foreign key(s). After the creation of the tables is mock data imported from mockaroo.com which is added through many insert statements. 

Next is the flask-app folder which includes 2 main categories of personas: 'users' and 'countries'. Both personas utilize Python flask. The users python file represents the side a client would see and the requests that they could make. There are 4 routes that are utilized in AppSmith that are represented through the visualization of the app. The 'countries' file uses 5 routes as well which include GET and POST requests. 

The init.py file contains the initlization of the Flask object and the configuration of the SQL ports. The routes are also registered in this file. 

The 'docker-compose' file is used to work as a medium and to put the files within containers to run everything together in unison. 

To create the actual application on AppSmith, we used ngrok, a rogrammable network edge that adds connectivity, security, and observability to our World Cup app. 
