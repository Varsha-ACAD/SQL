-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Find the crime scene report
SELECT description FROM crime_scene_reports
WHERE month = 7 AND day = 28 AND street = 'Humphrey Street';

-- Look up interviews conducted at the bakery on July 28
SELECT * FROM interviews
WHERE transcript LIKE '%bakery%' AND month = 7 AND day = 28;

/*
Ruth:  
Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. 
If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.

Eugene: 
I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, 
I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.

Raymond: 
As the thief was leaving the bakery, they called someone who talked to them for less than a minute. 
In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. 
The thief then asked the person on the other end of the phone to purchase the flight ticket.

Emma:
I'm the bakery owner, and someone came in, suspiciously whispering into a phone for about half an hour. They never bought anything.
*/

-- First, consider Ruth's interview
-- Look up license plate numbers of cars that left the bakery within 10 minutes of theft
SELECT license_plate FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND hour = 10 AND minute >= 15 AND minute <= 25
AND activity = 'exit';

-- Look up names of people who own those cars
SELECT name FROM people WHERE license_plate IN (
    SELECT license_plate FROM bakery_security_logs
    WHERE month = 7 AND day = 28 AND hour = 10 AND minute >= 15 AND minute <= 25
    AND activity = 'exit'
);

-- This leads us to eight suspects:
-- Vanessa, Barry, Iman, Sofia, Luca, Diana, Kelsey, Bruce

-- Next, consider Eugene's interview
-- Look up Leggett Street ATM transactions on that day
SELECT account_number FROM atm_transactions
WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street';

-- Join the bank accounts table to identify the people who own those bank accounts
SELECT person_id FROM atm_transactions
JOIN bank_accounts ON bank_accounts.account_number = atm_transactions.account_number
WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street';

-- Look up the names of the people who own those bank accounts
SELECT name FROM people WHERE id IN (
    SELECT person_id FROM atm_transactions
    JOIN bank_accounts ON bank_accounts.account_number = atm_transactions.account_number
    WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street'
);

-- This gives us nine people:
-- Kenny, Iman, Benista, Taylor, Brooke, Luca, Diana, Bruce, Kaelyn
-- If we consider only those who are already suspects, we have four remaining suspects:
-- Iman, Luca, Diana, Bruce

-- Next, consider Raymond's interview
-- Look up calls that were less than a minute on the day of the theft
SELECT caller FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 60;

-- Look up the names of the people who made those calls
SELECT name FROM people WHERE phone_number IN (
    SELECT caller FROM phone_calls
    WHERE month = 7 AND day = 28 AND duration < 60
);

-- This gives us eight people:
-- Kenny, Sofia, Benista, Taylor, Diana, Kelsey, Bruce, Carina
-- If we consider only those who are already suspects, we have two remaining suspects:
-- Diana, Bruce

-- Look up the earliest flight out of Fiftyville for the following day
SELECT id FROM flights
WHERE origin_airport_id = (SELECT id FROM airports WHERE city = 'Fiftyville')
AND month = 7 AND day = 29 ORDER BY hour, minute ASC LIMIT 1;

-- Get the passport numbers for the passengers on that flight
SELECT passport_number FROM passengers WHERE flight_id = (
    SELECT id FROM flights
    WHERE origin_airport_id = (SELECT id FROM airports WHERE city = 'Fiftyville')
    AND month = 7 AND day = 29 ORDER BY hour, minute ASC LIMIT 1
);

-- Look up the names of the people with those passport numbers
SELECT name FROM people WHERE passport_number IN (
    SELECT passport_number FROM passengers WHERE flight_id = (
        SELECT id FROM flights
        WHERE origin_airport_id = (SELECT id FROM airports WHERE city = 'Fiftyville')
        AND month = 7 AND day = 29 ORDER BY hour, minute ASC LIMIT 1
    )
);

-- This gives us eight people:
-- Kenny, Sofia, Taylor, Luca, Kelsey, Edward, Bruce, Doris
-- If we consider only those who are already suspects, we have our thief: BRUCE

-- We can verify this fact by combining all interview information into a single query
SELECT name FROM people
    WHERE license_plate IN
        (SELECT license_plate FROM bakery_security_logs
         WHERE month = 7 AND day = 28 AND hour = 10
         AND minute >= 15 AND minute <= 25)
    AND id IN
        (SELECT person_id
         FROM atm_transactions JOIN bank_accounts
         ON bank_accounts.account_number = atm_transactions.account_number
         WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street')
    AND passport_number IN
        (SELECT passport_number FROM passengers
         WHERE flight_id =
            (SELECT id FROM flights
             WHERE origin_airport_id =
                (SELECT id FROM airports
                 WHERE city = 'Fiftyville')
             AND month = 7 AND day = 29
             ORDER BY hour, minute ASC LIMIT 1))
    AND phone_number IN
        (SELECT caller FROM phone_calls
         WHERE month = 7 AND day = 28 AND duration < 60);

-- But where did they escape to? Look up the flight number.
SELECT city FROM airports WHERE id IN (
    SELECT destination_airport_id FROM flights WHERE id = (
        SELECT id FROM flights
        WHERE origin_airport_id = (SELECT id FROM airports WHERE city = 'Fiftyville')
        AND month = 7 AND day = 29 ORDER BY hour, minute ASC LIMIT 1
    )
);

-- So Bruce escaped to: NEW YORK CITY

-- And who was Bruce's accomplice? Look up name of the person who Bruce called.
SELECT name FROM people WHERE phone_number = (
    SELECT receiver FROM phone_calls WHERE caller = (
        SELECT phone_number FROM people WHERE name = 'Bruce'
    ) AND duration < 60 AND month = 7 AND day = 28 LIMIT 1
);

-- So the accomplice is: ROBIN

