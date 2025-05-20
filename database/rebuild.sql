-- Drop tables and type if they already exist
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS classification;
DROP TYPE IF EXISTS account_type_enum;

-- Create a new ENUM type for account_type
CREATE TYPE account_type_enum AS ENUM ('Client', 'Admin');

-- Create classification table
CREATE TABLE classification (
  classification_id SERIAL PRIMARY KEY,
  classification_name VARCHAR(50) NOT NULL
);

-- Create account table with ENUM account_type
CREATE TABLE account (
  account_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  account_type account_type_enum DEFAULT 'Client'
);

-- Create inventory table
CREATE TABLE inventory (
  inv_id SERIAL PRIMARY KEY,
  inv_make VARCHAR(50) NOT NULL,
  inv_model VARCHAR(50) NOT NULL,
  inv_year INT NOT NULL,
  inv_description TEXT NOT NULL,
  inv_image VARCHAR(255),
  inv_thumbnail VARCHAR(255),
  inv_price NUMERIC(10, 2),
  inv_miles INT,
  inv_color VARCHAR(30),
  classification_id INT REFERENCES classification(classification_id)
);

-- Insert classification values
INSERT INTO classification (classification_name)
VALUES ('Sport'), ('SUV'), ('Truck');

-- Insert inventory records with actual image names
INSERT INTO inventory (
  inv_make, inv_model, inv_year, inv_description,
  inv_image, inv_thumbnail, inv_price, inv_miles,
  inv_color, classification_id
)
VALUES 
('GM', 'Hummer', 2022, 'A vehicle with small interiors', '/images/hummer.jpg', '/images/hummer-tn.jpg', 40000.00, 10000, 'Black', 2),
('Ford', 'Mustang', 2023, 'High performance sport car', '/images/camaro.jpg', '/images/camaro-tn.jpg', 45000.00, 5000, 'Red', 1),
('Toyota', 'Supra', 2023, 'Compact and powerful', '/images/delorean.jpg', '/images/delorean-tn.jpg', 48000.00, 3000, 'White', 1),
('Chevy', 'Monster Truck', 2024, 'Heavy duty off-road machine', '/images/monster-truck.jpg', '/images/monster-truck-tn.jpg', 55000.00, 1500, 'Blue', 3);

-- Assignment 2 - Query 4: Update Hummer description
UPDATE inventory
SET inv_description = REPLACE(inv_description, 'small interiors', 'a huge interior')
WHERE inv_make = 'GM' AND inv_model = 'Hummer';

-- Assignment 2 - Query 6: Update image paths
UPDATE inventory
SET inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');
