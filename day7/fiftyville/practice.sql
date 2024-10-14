-- Practice Questions - increasing level of complexity

.headers on
.mode column

-- 1. List the names and phone numbers of all people.
-- 2. List the names of all people who don't have a passport. (Use IS NOT NULL!)
-- 3. List the flights on July 28, ordered by time.
-- 4. Which months in 2023 had over 40 reported crimes?
-- 5. Which street is the most prone to crime?
-- 6. How many people have mentioned 'Sherlock Holmes' in their interviews?
-- 7. Give details about the phone calls made by Abigail.
-- SELECT *
-- FROM phone_calls
-- WHERE caller = (
--     SELECT phone_number
--     FROM people
--     WHERE name = 'Abigail'
-- );

-- 8. How many flights has Margaret travelled by?
-- passengers, people
-- passport_number
-- SELECT COUNT(*)
-- FROM passengers
-- WHERE passport_number = (
--     SELECT passport_number
--     FROM people
--     WHERE name = 'Margaret'
-- );

-- 9. On what days has Marget travelled by flights?
-- 10. Which destinations has Margaret flown to?

-- CREATE VIEW flight_counts_2 AS
-- -- SELECT P1.name, COUNT(*)
-- FROM people P1 JOIN passengers P2
-- -- ON P1.passport_number = P2.passport_number
-- GROUP BY P1.name;

-- SELECT *
-- FROM flight_counts_2;


