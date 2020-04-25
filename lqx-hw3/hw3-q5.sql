/**
    returns 3 rows
    takes 22 s 77 ms
******************
The first 3 rows:
    Devils Lake ND
    Hattiesburg/Laurel MS
    St. Augustine FL

*/


SELECT F.dest_city AS city
FROM Flights AS F
WHERE F.dest_city NOT IN (
    SELECT F2.dest_city AS dest_city
    FROM Flights AS F1,
         Flights AS F2
    WHERE F1.origin_city = 'Seattle WA'
      AND F1.dest_city != 'Seattle WA'
      AND F1.dest_city = F2.origin_city
      AND F2.dest_city != 'Seattle WA'
    GROUP BY F2.dest_city) AND
F.dest_city != 'Seattle WA'
GROUP BY F.dest_city
ORDER BY F.dest_city ASC;