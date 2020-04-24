-- question 6
/*  4 rows returns
    the query took 5s 691ms

    the first 20 rows of the result:
    Alaska Airlines Inc.
    SkyWest Airlines Inc.
    United Air Lines Inc.
    Virgin America
 */

SELECT DISTINCT C.name AS carrier
FROM Carriers AS C,
    (SELECT F1.carrier_id
    FROM Flights AS F1
    WHERE F1.origin_city = 'Seattle WA'
    AND F1.dest_city = 'San Francisco CA'
    ) AS F
WHERE F.carrier_id = C.cid
ORDER BY carrier;