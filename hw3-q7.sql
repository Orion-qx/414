-- question 7
/*  4 rows returns
    the query took 11s 285ms

    the first 20 rows of the result:
    Alaska Airlines Inc.
    SkyWest Airlines Inc.
    United Air Lines Inc.
    Virgin America
 */

SELECT DISTINCT C.name AS carrier
FROM Flights AS F, Carriers AS C
WHERE F.carrier_id = C.cid
AND F.origin_city = 'Seattle WA'
AND F.dest_city = 'San Francisco CA'
ORDER BY carrier;