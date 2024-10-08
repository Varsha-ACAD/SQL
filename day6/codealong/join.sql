-- Joins --
.mode column

-- 1a. Retrieve the names of players along with the number of games they played in 1920.
-- Select count(*), players.first_name, players.last_name
-- From players Join performances
-- On players.id = performances.player_id
-- Where year = 1920
-- Group by performances.player_id;


-- 1b. Retrieve the names of players along with the names of the parks where their teams played in 1920.

-- SELECT players.first_name, players.last_name, teams.park
-- FROM players
-- JOIN performances ON players.id = performances.player_id
-- JOIN teams ON performances.team_id = teams.id
-- WHERE performances.year = 1920;

-- 2. Retrieve all player names, along with their performance records, including those players who have no performances in 1920.

-- Select players.first_name, players.last_name, performances.*
-- From players
-- Join performances
-- On players.id = performances.player_id
-- Where performances.year = 1920;

-- 3. Retrieve the names of players, their team names, and the salary they earned in 1985.
-- Select players.first_name, players.last_name, teams.name, salaries.year, salaries.salary
-- From players
-- Join salaries
-- On players.id = salaries.id
-- JOIN teams
-- On salaries.team_id = teams.id
-- Where salaries.year = 1985;


-- 4. List the names of players who hit more than 20 home runs in a single season,
-- along with the year and the team they played for.

-- SELECT players.first_name, players.last_name, performances.year, teams.name, performances.G
-- FROM players
-- JOIN performances ON players.id = performances.player_id
-- JOIN teams ON performances.team_id = teams.id
-- WHERE performances.G > 20 ;

-- 5. List the first & last name of the top 5 players with most home runs across their career.

Select players.first_name, players.last_name, performances.G
From players    
Join performances
On players.id = performances.player_id
Order by performances.G DESC
Limit 5;


-- Set Operations --
-- UNION, INTERSECT, EXCEPT

-- 1. Find the names of players who batted OR threw left-handed (use UNION).
-- 2. Find the names of players who both batted and threw left-handed (use INTERSECT).
-- 3. Retrieve the names of players who were born in the USA but not in California (use EXCEPT).
-- 4. Find the names of players who played in 2020 but did not play in 2021 (use EXCEPT).

-- Do we need set operations to answer these questions?