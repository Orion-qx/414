-- question 5
/*  3 rows returns
    the query took 5m 29s 108ms

    the first 20 rows of the result:
    Devils Lake ND
    Hattiesburg/Laurel MS
    St. Augustine FL
 */

SELECT F1.dest_city
FROM Flights AS F1
WHERE F1.dest_city NOT IN
    (SELECT F.dest_city
    FROM Flights AS F
    WHERE F.origin_city = 'Seattle WA'
    GROUP BY F.dest_city
    )
AND F1.dest_city NOT IN
    (SELECT F3.dest_city
    FROM Flights AS F2, Flights AS F3
    WHERE F2.dest_city = F3.origin_city
    AND F2.origin_city = 'Seattle WA'
    GROUP BY F3.dest_city
    )
GROUP BY F1.dest_city
ORDER BY F1.dest_city