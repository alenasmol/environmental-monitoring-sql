-- Query 1: Find the average measurement value for each sensor type in a specific location
SELECT 
    s.sensor_type, 
    AVG(e.measurement_value) AS average_value
FROM 
    EnvironmentalData e
JOIN 
    Sensors s ON e.sensor_id = s.sensor_id
JOIN 
    Locations l ON e.location_id = l.location_id
WHERE 
    l.region_name = 'Central Park'
GROUP BY 
    s.sensor_type;

-- Query 2: Identify locations where measurements exceed safe thresholds
SELECT 
    l.region_name, 
    s.sensor_type, 
    e.measurement_value, 
    t.safe_max
FROM 
    EnvironmentalData e
JOIN 
    Sensors s ON e.sensor_id = s.sensor_id
JOIN 
    Thresholds t ON s.sensor_type = t.sensor_type
JOIN 
    Locations l ON e.location_id = l.location_id
WHERE 
    e.measurement_value > t.safe_max;

-- Query 3: Calculate daily trends for a specific sensor type
SELECT 
    DATE(e.timestamp) AS date, 
    AVG(e.measurement_value) AS daily_average, 
    MIN(e.measurement_value) AS daily_minimum, 
    MAX(e.measurement_value) AS daily_maximum
FROM 
    EnvironmentalData e
JOIN 
    Sensors s ON e.sensor_id = s.sensor_id
WHERE 
    s.sensor_type = 'PM2.5'
GROUP BY 
    DATE(e.timestamp)
ORDER BY 
    date;

-- Query 4: List the top 3 most polluted regions based on PM2.5 levels
SELECT 
    l.region_name, 
    AVG(e.measurement_value) AS average_pm25
FROM 
    EnvironmentalData e
JOIN 
    Sensors s ON e.sensor_id = s.sensor_id
JOIN 
    Locations l ON e.location_id = l.location_id
WHERE 
    s.sensor_type = 'PM2.5'
GROUP BY 
    l.region_name
ORDER BY 
    average_pm25 DESC
LIMIT 3;
