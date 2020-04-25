/**
    returns 4 rows
    takes 3 s 82 ms
******************
The first 4 rows:
    Alaska Airlines Inc.
    SkyWest Airlines Inc.
    United Air Lines Inc.
    Virgin America
*/


WITH FLIGHT AS (
    SELECT F1.carrier_id AS f_cid
    FROM Flights AS F1
    WHERE F1.origin_city = 'Seattle WA' AND
          F1.dest_city = 'San Francisco CA'
)
SELECT C.name AS carrier
FROM Carriers AS C, FLIGHT AS F
WHERE C.cid = F.f_cid
GROUP BY C.name
ORDER BY C.name ASC;