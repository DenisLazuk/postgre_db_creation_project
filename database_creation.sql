-- Creating all of the tables
CREATE TABLE divisions (
  id integer PRIMARY KEY,
  name char(20)
);

CREATE TABLE teams (
  id integer PRIMARY KEY UNIQUE,
  name varchar(50),
  ltir_pool money,
  roster integer,
  contracts integer,
  retained_left integer,
  division_id integer REFERENCES divisions(id)
);

CREATE TABLE team_info (
  id integer PRIMARY KEY,
  head_coach varchar(50),
  site_link varchar(50),
  team_id integer REFERENCES teams(id) UNIQUE
);

CREATE TABLE affiliates (
  id integer PRIMARY KEY UNIQUE,
  name varchar(50),
  league varchar(5),
  team_id integer REFERENCES teams(id)
);

CREATE TABLE players (
  id integer PRIMARY KEY UNIQUE,
  name varchar(50),
  position varchar(2),
  age integer,
  team_id integer REFERENCES teams(id)
);

CREATE TABLE cap_hits (
  season varchar(10),
  player_id integer REFERENCES players(id),
  salary money,
  bonus money,
  constraints varchar(5),
  PRIMARY KEY (season, player_id)
);

CREATE TABLE status (
  season varchar(10),
  player_id integer REFERENCES players(id),
  name varchar(10),
  PRIMARY KEY (season, player_id)
);

-- Importing data
INSERT INTO divisions VALUES (
  1,
  'Atlantic'
);

INSERT INTO divisions VALUES (
  2,
  'Metropolitan'
);

INSERT INTO divisions VALUES (
  3,
  'Central'
);

INSERT INTO divisions VALUES (
  4,
  'Pacific'
);

INSERT INTO teams VALUES (
  1,
  'Boston Bruins',
  0,
  22,
  46,
  3,
  1
);

INSERT INTO team_info VALUES (
  1,
  'Jim Montgomery',
  'www.nhl.com/bruins',
  1
);

INSERT INTO affiliates VALUES (
  1,
  'Providence Bruins',
  'AHL',
  1
);

INSERT INTO affiliates VALUES (
  2,
  'Maine Mariners',
  'ECHL',
  1
);

INSERT INTO players VALUES (
  1,
  'Pastrnak, David',
  'RW',
  27,
  1
);

INSERT INTO players VALUES (
  2,
  'Marchand, Brad',
  'LW',
  35,
  1
);

INSERT INTO players VALUES (
  3,
  'Coyle, Charlie',
  'C',
  31,
  1
);

INSERT INTO players VALUES (
  4,
  'Krejci, David',
  'C',
  37,
  1
);

INSERT INTO cap_hits VALUES (
  '2023-2024',
  1,
  11250000,
  null,
  'NMC'
);

INSERT INTO cap_hits VALUES (
  '2023-2024',
  2,
  6125000,
  null,
  'M-NTC'
);

INSERT INTO cap_hits VALUES (
  '2023-2024',
  3,
  5250000,
  null,
  null
);

INSERT INTO cap_hits VALUES (
  '2024-2025',
  1,
  11250000,
  null,
  'NMC'
);

INSERT INTO cap_hits VALUES (
  '2024-2025',
  2,
  6125000,
  null,
  'M-NTC'
);

INSERT INTO cap_hits VALUES (
  '2024-2025',
  3,
  5250000,
  null,
  null
);

INSERT INTO cap_hits VALUES (
  '2025-2026',
  1,
  11250000,
  null,
  'NMC'
);

INSERT INTO cap_hits VALUES (
  '2025-2026',
  3,
  5250000,
  null,
  null
);

INSERT INTO cap_hits VALUES (
  '2026-2027',
  1,
  11250000,
  null,
  'NMC'
);

INSERT INTO status VALUES (
  '2023-2024',
  1,
  'contract'
);

INSERT INTO status VALUES (
  '2023-2024',
  2,
  'contract'
);

INSERT INTO status VALUES (
  '2023-2024',
  3,
  'contract'
);

INSERT INTO status VALUES (
  '2023-2024',
  4,
  'UFA'
);

INSERT INTO status VALUES (
  '2024-2025',
  1,
  'contract'
);

INSERT INTO status VALUES (
  '2024-2025',
  2,
  'contract'
);

INSERT INTO status VALUES (
  '2024-2025',
  3,
  'contract'
);

INSERT INTO status VALUES (
  '2024-2025',
  4,
  null
);

INSERT INTO status VALUES (
  '2025-2026',
  1,
  'contract'
);

INSERT INTO status VALUES (
  '2025-2026',
  2,
  'UFA'
);

INSERT INTO status VALUES (
  '2025-2026',
  3,
  'contract'
);

INSERT INTO status VALUES (
  '2025-2026',
  4,
  null
);

INSERT INTO status VALUES (
  '2026-2027',
  1,
  'contract'
);

INSERT INTO status VALUES (
  '2026-2027',
  2,
  null
);

INSERT INTO status VALUES (
  '2026-2027',
  3,
  'UFA'
);

INSERT INTO status VALUES (
  '2026-2027',
  4,
  null
);

-- Let's try somу queries
-- Find caphit by season
SELECT status.season, SUM(cap_hits.salary)
FROM status
INNER JOIN cap_hits
	ON status.player_id = cap_hits.player_id
WHERE status.name = 'contract'
GROUP BY 1;

-- Find caphit by position
SELECT players.name, players.position, SUM(cap_hits.salary)
FROM players
INNER JOIN cap_hits
	ON players.id = cap_hits.player_id
GROUP BY players.id, players.position
