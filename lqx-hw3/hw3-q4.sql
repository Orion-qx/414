/**
    return 256 rows
    takes 17 s 28 ms
******************
The first 20 rows:
    Aberdeen SD
    Abilene TX
    Adak Island AK
    Aguadilla PR
    Akron OH
    Albany GA
    Albany NY
    Alexandria LA
    Allentown/Bethlehem/Easton PA
    Alpena MI
    Amarillo TX
    Appleton WI
    Arcata/Eureka CA
    Asheville NC
    Ashland WV
    Aspen CO
    Atlantic City NJ
    Augusta GA
    Bakersfield CA
    Bangor ME

*/


SELECT F2.dest_city AS city
FROM Flights AS F1, Flights AS F2
WHERE F1.origin_city = 'Seattle WA'
AND F1.dest_city != 'Seattle WA'
AND F1.dest_city = F2.origin_city
AND F2.dest_city != 'Seattle WA'
AND F2.dest_city NOT IN
    (
        SELECT F.dest_city AS direct_city
        FROM Flights AS F
        WHERE F.origin_city = 'Seattle WA'
        GROUP BY F.dest_city
    )
GROUP BY F2.dest_city
ORDER BY F2.dest_city ASC;