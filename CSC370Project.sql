/* on delete cascade */

create table airlines (
acode int NOT NULL AUTOINCREMENT,
name varchar(100),
website varchar(100),
primary key(acode)
);

create table routes(
rnum int NOT NULL AUTOINCREMENT,
planemodel int,
routetype varchar(10) NOT NULL CHECK (routetype IN("outgoing", "incoming")),
primary key(rnum)
);

/* weak entity set */
create table operates(
rnum int NOT NULL AUTOINCREMENT,
acode int,
primary key(rnum, acode),
foreign key(rnum) references routes,
foreign key(acode) references airlines
);

create table outgoingRoutes(
destination varchar(100),
outT date,
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
gate varchar(10),
depT date,
rnum int,
foreign key (rnum) references outgoingroutes
);

create table arrivals (
arrid int primary key NOT NULL AUTOINCREMENT,
gate varchar(10),
arrT date,
rnum int,
foreign key (rnum) references incomingroutes
);

CREATE TABLE Passengers
(
  pID int NOT NULL AUTOINCREMENT,
  name VARCHAR(100),
  gov_issued_id int,
  dob DATE,
  pob VARCHAR,
  arrivalID int,
  departureID int,
  primary key(pID),
  foreign key(arrivalID) references incomingroutes.rnum,
  foreign key(departureID) references outgoingroutes.rnum
);

CREATE TABLE Baggage
(
  bID int NOT NULL AUTOINCREMENT,
  weightKG int,
  primary key(bID),
  pID int REFERENCES Passengers(pID)
);
