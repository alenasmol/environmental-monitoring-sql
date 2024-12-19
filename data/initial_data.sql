-- Insert data into Locations
INSERT INTO Locations (region_name, latitude, longitude, country)
VALUES
    ('Central Park', 40.785091, -73.968285, 'USA'),
    ('Hyde Park', 51.507268, -0.165730, 'UK'),
    ('Yoyogi Park', 35.671649, 139.694412, 'Japan');

-- Insert data into Sensors
INSERT INTO Sensors (sensor_type, description, unit)
VALUES
    ('CO2', 'Carbon Dioxide Sensor', 'ppm'),
    ('PM2.5', 'Particulate Matter Sensor', 'µg/m³'),
    ('Temperature', 'Temperature Sensor', '°C');

-- Insert data into Thresholds
INSERT INTO Thresholds (sensor_type, safe_min, safe_max)
VALUES
    ('CO2', 400, 1000),
    ('PM2.5', 0, 35),
    ('Temperature', -10, 35);

-- Insert data into EnvironmentalData
INSERT INTO EnvironmentalData (sensor_id, location_id, measurement_value, timestamp)
VALUES
    (1, 1, 420, '2024-12-01 08:00:00'),
    (2, 1, 15, '2024-12-01 08:00:00'),
    (3, 1, 22.5, '2024-12-01 08:00:00'),
    (1, 2, 600, '2024-12-01 08:30:00'),
    (2, 2, 40, '2024-12-01 08:30:00'),
    (3, 2, 18, '2024-12-01 08:30:00');
