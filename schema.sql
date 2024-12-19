-- Table: Locations
CREATE TABLE Locations (
    location_id SERIAL PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL,
    latitude DECIMAL(9, 6) NOT NULL,
    longitude DECIMAL(9, 6) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- Table: Sensors
CREATE TABLE Sensors (
    sensor_id SERIAL PRIMARY KEY,
    sensor_type VARCHAR(50) NOT NULL,
    description TEXT,
    unit VARCHAR(20) NOT NULL
);

-- Table: EnvironmentalData
CREATE TABLE EnvironmentalData (
    data_id SERIAL PRIMARY KEY,
    sensor_id INT NOT NULL,
    location_id INT NOT NULL,
    measurement_value DECIMAL(10, 2) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- Table: Thresholds
CREATE TABLE Thresholds (
    threshold_id SERIAL PRIMARY KEY,
    sensor_type VARCHAR(50) NOT NULL,
    safe_min DECIMAL(10, 2),
    safe_max DECIMAL(10, 2),
    FOREIGN KEY (sensor_type) REFERENCES Sensors(sensor_type)
);
