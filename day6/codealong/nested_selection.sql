-- Nested Selection -- 
.mode column

-- What if we had to combine information from different tables?

-- 1. Which players are taller than the average height?
-- Select AVG(height)
-- From players;

-- Select first_name, last_name, height
-- From players
-- Where height > 71.9
-- LIMIT 5;

-- 2. Which players were born in the most common birthplace(city)?
-- Select birth_city, COUNT(birth_city)
-- from players
-- Group by birth_city
-- Order by COUNT(birth_city) DESC
-- limit 1;

-- 3. Which players have played for the team Atlanta Braves?
-- SELECT first_name, last_name
-- FROM players
-- WHERE id IN (
-- SELECT player_id
-- FROM performances
-- WHERE team_id = 
-- ( SELECT id
-- FROM teams
-- WHERE name = 'Atlanta Braves') );

-- 4. Which players are likely to have played at Olympics Grounds?
-- SELECT first_name, last_name
-- FROM players
-- WHERE id IN (
-- SELECT player_id
-- FROM performances
-- WHERE team_id IN (
-- SELECT id
-- FROM teams
-- WHERE park = 'Olympics Grounds') );

-- 5. Which players have played for the team with the most wins?
SELECT first_name, last_name
FROM players
WHERE id IN (
SELECT player_id
FROM performances
WHERE team_id IN (
SELECT id
FROM teams
WHERE id = (
SELECT team_id
FROM (
SELECT team_id, COUNT(team_id)
FROM performances
GROUP BY team_id
ORDER BY COUNT(team_id) DESC) ) ) );
