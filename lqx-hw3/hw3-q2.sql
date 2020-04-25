/**
    returns 109 rows
    takes 15 s 47 ms
******************
The first 20 rows:
    Aberdeen SD
    Abilene TX
    Alpena MI
    Ashland WV
    Augusta GA
    Barrow AK
    Beaumont/Port Arthur TX
    Bemidji MN
    Bethel AK
    Binghamton NY
    Brainerd MN
    Bristol/Johnson City/Kingsport TN
    Butte MT
    Carlsbad CA
    Casper WY
    Cedar City UT
    Chico CA
    College Station/Bryan TX
    Columbia MO
    Columbus GA
*/


WITH LONGEST_FLIGHT AS (
    SELECT F1.origin_city AS origin_city, MAX(F1.actual_time) AS time
    FROM Flights AS F1
    GROUP BY F1.origin_city
)
SELECT F.origin_city AS city
FROM Flights AS F, LONGEST_FLIGHT AS LF
WHERE (LF.time < 180 OR LF.time = NULL) AND
      F.origin_city = LF.origin_city AND
      F.actual_time = LF.time
GROUP BY F.origin_city
ORDER BY F.origin_city ASC;