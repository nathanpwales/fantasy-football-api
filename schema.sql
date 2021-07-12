CREATE TABLE players (
	name varchar(50) NOT NULL,
	team varchar(50) DEFAULT NULL,
       	sports_ref_id varchar(20) NOT NULL, 
	pID int NOT NULL AUTO_INCREMENT, 
	primary key (pID)
);

CREATE TABLE defenses (
	name varchar(50) NOT NULL,
	dID int NOT NULL AUTO_INCREMENT,
	primary key(dID)
);	

CREATE TABLE weeks (
	num int NOT NULL,
	season int NOT NULL,
	wID int NOT NULL AUTO_INCREMENT,
       	PRIMARY KEY (wID),
	UNIQUE (num, season)
);

CREATE TABLE offensive_scores (
	playerID int NOT NULL,
	weekID int NOT NULL,
	projected_points real DEFAULT 0,
	PPR real DEFAULT 0,
	half_PPR real DEFAULT 0,
	non_PPR real DEFAULT 0,
	opponent varchar(50),
	position_rank int DEFAULT 0,
	PRIMARY KEY (playerID, weekID),
	FOREIGN KEY (playerID) references players(pID),
	FOREIGN KEY (weekID) references weeks(wID)
);

CREATE TABLE defensive_scores (
	defenseID int NOT NULL,
	weekID int NOT NULL,
	projected_points real DEFAULT 0,
	PPR real DEFAULT 0,
	half_PPR real DEFAULT 0,
	non_PPR real DEFAULT 0,
	opponent varchar(50),
	defense_rank int DEFAULT 0,
	PRIMARY KEY (defenseID, weekID),
	FOREIGN KEY (defenseID) references defenses(dID),
	FOREIGN KEY (weekID) references weeks(wID)
);

CREATE TABLE position_ranking (
	position_rank int DEFAULT 0,
	playerID int NOT NULL,
	season int NOT NULL,
	PRIMARY KEY (playerID, season),
	FOREIGN KEY (playerID) references players(pID)
);
