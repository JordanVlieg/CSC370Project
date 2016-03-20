/* on delete cascade */

create table airlines (
acode int NOT NULL AUTOINCREMENT,
name varchar(100) NOT NULL,
website varchar(100),
primary key(acode),
unique(acode,name,website)
);

create table routes(
rnum int NOT NULL AUTOINCREMENT,
planemodel int NOT NULL,
routetype varchar(10) NOT NULL CHECK (routetype IN("outgoing", "incoming")),
primary key(rnum)
);

/* weak entity set */
create table operates(
rnum int NOT NULL AUTOINCREMENT,
acode int NOT NULL,
primary key(rnum, acode),
foreign key(rnum) references routes,
foreign key(acode) references airlines
);

create table outgoingRoutes(
destination varchar(100) NOT NULL,
outT date NOT NULL,
routetype varchar(10) NOT NULL CHECK (routetype IN("outgoing")),
rnum int NOT NULL,
primary key(rum),
foreign key(rnum, routetype) references routes(rnum, routetype)
);

create table incomingRoutes(
source varchar(100),
incT date,
routetype varchar(10) NOT NULL CHECK (routetype IN("incoming")),
rnum int NOT NULL,
primary key(rum),
foreign key(rnum, routetype) references routes(rnum, routetype)
);

create table departures(
deptid int primary key NOT NULL AUTOINCREMENT,
gate varchar(10) NOT NULL,
depT date NOT NULL,
rnum int NOT NULL,
foreign key (rnum) references outgoingroutes
);

create table arrivals (
arrid int primary key NOT NULL AUTOINCREMENT,
gate varchar(10) NOT NULL,
arrT date NOT NULL,
rnum int NOT NULL,
foreign key (rnum) references incomingroutes
);

CREATE TABLE Passengers
(
  pID int NOT NULL AUTOINCREMENT,
  name VARCHAR(100) NOT NULL,
  gov_issued_id int NOT NULL,
  dob DATE NOT NULL,
  pob VARCHAR NOT NULL,
  arrivalID int NOT NULL,
  departureID int NOT NULL,
  primary key(pID) NOT NULL,
  foreign key(arrivalID) references incomingroutes.rnum,
  foreign key(departureID) references outgoingroutes.rnum
);

CREATE TABLE Baggage
(
  bID int NOT NULL AUTOINCREMENT,
  weightKG int NOT NULL,
  primary key(bID),
  pID int REFERENCES Passengers(pID) not null
);
