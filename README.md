#Off-Platform Project: Designing a Database From Scratch

##The main purposes of this project are:

- [x] To design a database schema on a topic of your choosing: NHL Market Cap
- [x] To implement that schema on computer using Postbird.

### Technologies used:
```
Postbird
```

### Database:
```
Created from scratch based on:
https://puckpedia.com/
```

The `divisions` table has the following fields:

Headers | Description |
--- | --- |
`id` | unique division id (primary key)
`name` | name of the division

The `teams` table has the following fields:

Headers | Description |
--- | --- |
`id` | unique team id (primary key)
`name` | name of the team
`ltir_pool` | The maximum amount of Long Term Injured Reserve space potentially available
`roster` | current number of players in roster
`contracts` | current number of players with contract
`retained_left` | number of contracts with retained salary left
`division_id` | id of the division (foreign key)

The `team_info` table has the following fields:

Headers | Description |
--- | --- |
`id` | unique id (primary key)
`head_coach` | name of the head coach
`site_link` | link to the team's website
`team_id` | id of the team (foreign key)

The `affiliates` table has the following fields:

Headers | Description |
--- | --- |
`id` | unique affiliate id (primary key)
`name` | name of the affiliate team
`leage` | name of the league
`team_id` | id of the head team (foreign key)

The `players` table has the following fields:

Headers | Description |
--- | --- |
`id` | unique player id (primary key)
`name` | name of the player
`position` | position of the player
`age` | current age of the player
`team_id` | id of the team (foreign key)

The `status` table has the following fields:

Headers | Description |
--- | --- |
`season` | name of the season (primary key)
`player_id` | unique player id (primary key)
`name` | current status of player

The `cap_hits` table has the following fields:

Headers | Description |
--- | --- |
`season` | name of the season (primary key)
`player_id` | unique player id (primary key) (foreign key)
`salary` | salary of the player in given season
`bonus` | bonus of the player in given season
`constraints` | any contract constraint

---

## Instructions ##
1. Create empty database in Postbird
2. Implement the code of database_creation.sql
3. Make some queries
