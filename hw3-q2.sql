-- question 2
/*  109 query returns
    the query took 9s 840ms

    the first 20 rows of the result:
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

SELECT DISTINCT F.origin_city as city
FROM Flights as F
GROUP BY F.origin_city
HAVING MAX(F.actual_time) < 3*60
ORDER BY city;