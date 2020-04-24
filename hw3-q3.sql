-- question 3
/*  327 query returns
    the query took 16s 62ms

    the first 20 rows of the result:
    Guam TT,
    Pago Pago TT,
    Aguadilla PR,29.430000000000
    Anchorage AK,32.150000000000
    San Juan PR,33.890000000000
    Charlotte Amalie VI,40.000000000000
    Ponce PR,41.940000000000
    Fairbanks AK,50.690000000000
    Kahului HI,53.660000000000
    Honolulu HI,54.910000000000
    San Francisco CA,56.310000000000
    Los Angeles CA,56.600000000000
    Seattle WA,57.760000000000
    Long Beach CA,62.450000000000
    Kona HI,63.280000000000
    New York NY,63.480000000000
    Las Vegas NV,65.160000000000
    Christiansted VI,65.330000000000
    Newark NJ,67.140000000000
    Worcester MA,67.740000000000
 */

SELECT F2.origin_city as origin_city,
       ROUND(F1.NumShortFlights*100.0/F2.NumFlights, 2) as percentage
FROM
(SELECT F.origin_city, COUNT(F.actual_time) as NumShortFlights
FROM Flights as F
WHERE F.actual_time IS NULL
OR F.actual_time < 3*60
GROUP BY F.origin_city) as F1
RIGHT JOIN
(SELECT F.origin_city, COUNT(*) as NumFlights
FROM Flights as F
GROUP BY F.origin_city) as F2
ON F1.origin_city = F2.origin_city
ORDER BY percentage;