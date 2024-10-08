-- Recap Exercises --
-- Single Table Selection
-- Here, we will focus on the players & teams tables.

.headers on
.mode column

-- 1. List all distinct team names from the Teams table.
-- Select distinct name 
-- from teams;


-- 2. List the names of all players in alphabetical order.
-- Select first_name, last_name
-- from players
-- order by first_name ASC;

-- 3. Select the top 5 players based on batting averages.
-- Select RBI
-- from performances
-- order by RBI DESC
-- limit 5;

-- 4. Count the number of players in each team.
-- Select team_id, count(distinct player_id)
-- from performances
-- GROUP BY team_id;

-- 5. Which teams have more than 10 players?
-- select team_id, count(distinct player_id)
-- from performances
-- group by team_id
-- having count(distinct player_id) > 10;

-- Questions for Additional Practice
-- LIMIT
-- 6. Select the top 10 players with the highest number of RBIs (Runs Batted In).
-- 7. Find the top 5 teams with the most championships won.

-- Aggregate Functions
-- 8. Calculate the total number of home runs hit by all players.
-- 9. Find the average number of wins for all teams.
-- 10. Calculate the maximum number of strikeouts by any player.

-- GROUP BY
-- 11. Group players by their position and count the number of players in each position.
-- 12. Group teams by their league and calculate the average number of wins for each league.

-- HAVING
-- 13. Find teams with an average player age greater than 30.
-- 14. Find positions with more than 5 players.

--additional practice

-- HAVING
-- 13. Find teams with an average player age greater than 30.
-- 14. Find positions with more than 5 players.





