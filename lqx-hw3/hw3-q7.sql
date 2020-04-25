/**
    return 4 rows
    takes 3 s 69 ms
******************
The first 4 rows:
    Alaska Airlines Inc.
    SkyWest Airlines Inc.
    United Air Lines Inc.
    Virgin America
*/


SELECT C.name AS carrier
FROM Carriers AS C, Flights AS F
WHERE C.cid = F.carrier_id AND
      F.origin_city = 'Seattle WA' AND
      F.dest_city = 'San Francisco CA'
GROUP BY C.name
ORDER BY C.name ASC;