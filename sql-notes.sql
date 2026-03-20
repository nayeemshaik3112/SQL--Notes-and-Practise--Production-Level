-- SQL Notes

-- Create Table
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Insert Data
INSERT INTO users VALUES (1, 'Nayeem', 'nayeem@gmail.com');

-- Select
SELECT * FROM users;