/**
    returns 327 rows
    takes 20 s 21 ms
******************
The first 20 rows:
    Pago Pago TT,
    Guam TT,
    Aguadilla PR,29.433962264150
    Anchorage AK,32.146037399821
    San Juan PR,33.890360709190
    Charlotte Amalie VI,40.000000000000
    Ponce PR,41.935483870967
    Fairbanks AK,50.691244239631
    Kahului HI,53.664998528113
    Honolulu HI,54.908808692277
    San Francisco CA,56.307656826568
    Los Angeles CA,56.604107648725
    Seattle WA,57.755416553349
    Long Beach CA,62.454116413214
    Kona HI,63.282107574094
    New York NY,63.481519772551
    Las Vegas NV,65.163009288383
    Christiansted VI,65.333333333333
    Newark NJ,67.137355584082
    Worcester MA,67.741935483870

*/


WITH SHORTER_THAN_THREE AS (
    SELECT F.origin_city AS each_city, COUNT(F.dest_city) AS shorter_than_three_city
    FROM Flights AS F
    WHERE F.actual_time < 180
    GROUP BY F.origin_city
)
SELECT F1.origin_city AS origin_city, (STT.shorter_than_three_city*100.0/COUNT(F1.dest_city)) AS percentage
FROM Flights AS F1
LEFT JOIN SHORTER_THAN_THREE AS STT
ON  F1.origin_city = STT.each_city
GROUP BY F1.origin_city, STT.shorter_than_three_city
ORDER BY percentage ASC;