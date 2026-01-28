-- Q3: Count short trips
SELECT COUNT(*) 
FROM green_taxi
WHERE lpep_pickup_datetime >= '2025-11-01'
  AND lpep_pickup_datetime < '2025-12-01'
  AND trip_distance <= 1;

-- Q4: Longest trip day (distance < 100 miles)
SELECT DATE(lpep_pickup_datetime) AS day,
       MAX(trip_distance) AS max_distance
FROM green_taxi
WHERE trip_distance < 100
GROUP BY day
ORDER BY max_distance DESC
LIMIT 1;

-- Q5: Biggest pickup zone by total_amount on 2025-11-18
SELECT z."Zone", SUM(g.total_amount) AS total
FROM green_taxi g
JOIN zones z ON g.PULocationID = z."LocationID"
WHERE DATE(g.lpep_pickup_datetime) = '2025-11-18'
GROUP BY z."Zone"
ORDER BY total DESC
LIMIT 1;

-- Q6: Largest tip from East Harlem North
SELECT z2."Zone", MAX(g.tip_amount) AS max_tip
FROM green_taxi g
JOIN zones z1 ON g.PULocationID = z1."LocationID"
JOIN zones z2 ON g.DOLocationID = z2."LocationID"
WHERE z1."Zone" = 'East Harlem North'
GROUP BY z2."Zone"
ORDER BY max_tip DESC
LIMIT 1;
