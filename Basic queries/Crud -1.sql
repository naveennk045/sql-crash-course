USE practice;

-- CREATION

CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(20) UNIQUE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    preferences JSON DEFAULT NULL,
    status ENUM('ACTIVE','INACTIVE','BANNED') DEFAULT 'ACTIVE'
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT DEFAULT 1,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    product_description TEXT,
    added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Show tables to confirm the creation
SHOW TABLES;

-- Read Tables
SELECT * FROM Users;
SELECT * FROM orders;
SELECT * FROM products;

-- Describe tables
DESCRIBE Users;
DESCRIBE Orders;
DESCRIBE Products;


-- Alter Users table to add status column if not already done
ALTER TABLE Users ADD COLUMN status ENUM('ACTIVE','INACTIVE','BANNED') DEFAULT 'ACTIVE';


-- Insert products
INSERT INTO Products (product_name, category, price, stock_quantity, product_description)
VALUES 
    ('Soap', 'Personal Care', 50.00, 100, 'A bar of soap for personal hygiene'),
    ('Headphone', 'Electronics', 250.00, 50, 'Over-ear headphones with noise cancellation'),
    ('Mouse', 'Electronics', 340.00, 200, 'Wireless optical mouse with ergonomic design'),
    ('Pencil', 'Stationery', 10.00, 500, 'Wooden pencil with durable lead'),
    ('Juice', 'Beverages', 50.00, 150, '100% natural fruit juice'),
    ('Nuts', 'Snacks', 200.00, 120, 'Mixed nuts for a healthy snack'),
    ('Charger Cable', 'Electronics', 200.00, 150, 'Fast charging USB-C cable');

-- Insert users
INSERT INTO Users(name, email, phone_number)
VALUES
  ('RAM','ram@gmail.com','9846589566'),
  ('RUBY','ruby@gmail.com','9847589566'),
  ('KANAN','kannan@gmail.com','9806589566'),
  ('KEDHAR','kedhar@gmail.com','9846589666');
  
--  After Alteration
INSERT INTO Users(name, email, phone_number, status)
VALUES
  ('RAVI', 'ravi@gmail.com', '9876543211', 'INACTIVE'),
  ('MAYA', 'maya@gmail.com', '9998887771', 'BANNED'),
  ('KARTIK', 'kartik@gmail.com', '9888777665', 'INACTIVE'),
  ('NEHA', 'neha@gmail.com', '9898776655', 'BANNED'),
  ('ADITYA', 'aditya@gmail.com', '9812345678', 'INACTIVE'),
  ('PRIYA', 'priya2@gmail.com', '9900112234', 'INACTIVE'),
  ('ROHIT', 'rohit@gmail.com', '9944776655', 'BANNED'),
  ('SHUBHAM', 'shubham@gmail.com', '9900666777', 'INACTIVE'),
  ('MALTI', 'malti@gmail.com', '9911223344', 'BANNED'),
  ('VANDANA', 'vandana@gmail.com', '9899888777', 'INACTIVE'),
  ('RAKESH', 'rakesh@gmail.com', '9988776655', 'BANNED'),
  ('MEERA', 'meera@gmail.com', '9899882211', 'INACTIVE'),
  ('AJAY', 'ajay@gmail.com', '9888772299', 'BANNED'),
  ('SUNITA', 'sunitas@gmail.com', '9990011223', 'INACTIVE'),
  ('SITA', 'sita@gmail.com', '9991122334', 'BANNED'),
  ('DEEPAK', 'deepak@gmail.com', '9933445567', 'INACTIVE'),
  ('NITIN', 'nitin@gmail.com', '9933556677', 'BANNED'),
  ('TARA', 'tara@gmail.com', '9912334455', 'INACTIVE'),
  ('KAVYA', 'kavya2@gmail.com', '9977886655', 'BANNED'),
  ('VIKRAM', 'vikram@gmail.com', '9998887777', 'ACTIVE'),
  ('PRIYA', 'priya@gmail.com', '9876543210', 'INACTIVE'),
  ('SURESH', 'suresh@gmail.com', '9888765432', 'BANNED'),
  ('TANVI', 'tanvi@gmail.com', '9933445566', 'INACTIVE'),
  ('RAJESH', 'rajesh@gmail.com', '9991234567', 'BANNED'),
  ('POOJA', 'pooja@gmail.com', '9886655443', 'ACTIVE'),
  ('ANITA', 'anita@gmail.com', '9832123456', 'INACTIVE'),
  ('JAY', 'jay@gmail.com', '9876532100', 'ACTIVE'),
  ('KAVITA', 'kavita@gmail.com', '9900112233', 'BANNED');

-- Insert orders
INSERT INTO Orders(user_id, product_name, quantity, total_amount)
VALUES 
  (2, 'Soap', 3, 150),
  (2, 'Headphone', 1, 250),
  (2, 'Mouse', 2, 680),
  (2, 'Soap', 2, 100),
  (1, 'Pencil', 2, 20),
  (1, 'Juice', 2, 100),
  (3, 'Nuts', 1, 200),
  (3, 'Charger Cable', 1, 200);


-- for advertising purpose create a inactive user table

	CREATE TABLE inactive_user(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL ,
    name VARCHAR(100) ,
    email VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
    );
    
 --   DROP TABLE inactive_user;

-- Insertion of inactive users

INSERT INTO inactive_users(user_id,name,email)
SELECT user_id,name,email
FROM Users
WHERE status = 'INACTIVE';

SELECT * FROM inactive_users;


  
  -- Renaming a column
  
ALTER TABLE inactive_user RENAME TO inactive_users;


-- Insert with expression and IGNORE key word

INSERT INTO Users(name, email, phone_number, status)
VALUES
  (SHA2('RAVI',256), 'ravi@gmail.com', '9876543211', UPPER('inactive')),-- This will give error "Duplicate Entry"
  (SHA2('SHINSU',256), 'shinsu@gmail.com', '9875553211', UPPER('inactive')),
  (SHA2('KARTHI',256), 'karthi@gmail.com', '9876593211', UPPER('inactive'));

/*   Error Code: 1062. Duplicate entry 'ravi@gmail.com' for key 'users.email'
*/


-- Skip rows that would cause errors (e.g., duplicate PRIMARY KEY values).

INSERT IGNORE INTO Users(name, email, phone_number, status)
VALUES
  (SHA2('RAVI',256), 'ravi@gmail.com', '9876543211', UPPER('inactive')),
  (SHA2('SHINSU',256), 'shinsu@gmail.com', '9875553211', UPPER('inactive')),
  (SHA2('KARTHI',256), 'karthi@gmail.com', '9876593211', UPPER('inactive'));
  
  -- Insertion successfull
  
    -- Updation with Insertkey word
INSERT INTO Users(name, email, phone_number, status)
VALUES
  ('RAVI', 'ravi@gmail.com', '9876543211', UPPER('inactive'))
  ON DUPLICATE KEY UPDATE phone_number='7604947411';
  
  -- Deletion
 DELETE FROM Users 
 WHERE  user_id =39 OR  user_id=40;
  
  --  Insert with subbquery --dynamic
INSERT INTO Orders(user_id, product_name, quantity, total_amount)
VALUES 
  (2, 'Soap', 10, (SELECT price*quantity FROM products WHERE product_name='Soap'));
  
