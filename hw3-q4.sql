-- question 4
/*  256 query returns
    the query took 29s 253ms

    the first 20 rows of the result:
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
FROM Flights AS F1
JOIN
    (SELECT F3.origin_city, F3.dest_city
    FROM Flights AS F3
    WHERE F3.dest_city != 'Seattle WA'
    AND F3.dest_city NOT IN
        (SELECT F4.dest_city
        FROM Flights AS F4
        WHERE F4.origin_city = 'Seattle WA'
        GROUP BY F4.dest_city
        )
    GROUP BY F3.origin_city, F3.dest_city) AS F2
ON F1.dest_city = F2.origin_city
WHERE F1.origin_city = 'Seattle WA'
GROUP BY F2.dest_city
ORDER BY F2.dest_city;