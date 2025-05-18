-- =========================================
-- SQL FILTERING GUIDE - SYNTAX COLLECTION
-- =========================================

-- Create a sample table
CREATE TABLE employee (
    emp_id INT,
    fname VARCHAR(50),
    lname VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    manager_id INT
);

-- Sample Data Insertion (Optional for testing)
INSERT INTO employee VALUES
(1, 'John', 'Barker', 'HR', 45000, '2022-03-10', NULL),
(2, 'Alice', 'Parker', 'Finance', 52000, '2020-07-12', 1),
(3, 'Bob', 'Jameson', 'IT', 60000, '2021-05-21', 1),
(4, 'Eve', 'Hawthorne', 'HR', 49000, '2023-01-01', NULL);

-- ================================
-- 1. LOGICAL OPERATORS
-- ================================

-- AND
SELECT * FROM employee
WHERE department = 'HR' AND salary > 40000;

-- OR
SELECT * FROM employee
WHERE department = 'HR' OR department = 'Finance';

-- NOT
SELECT * FROM employee
WHERE NOT department = 'HR';

-- ================================
-- 2. COMPARISON OPERATORS
-- ================================

-- Equal
SELECT * FROM employee
WHERE salary = 50000;

-- Not Equal
SELECT * FROM employee
WHERE salary != 50000;

-- Not Equal (Standard SQL)
SELECT * FROM employee
WHERE salary <> 50000;

-- Less than / Greater than
SELECT * FROM employee
WHERE salary > 40000;

SELECT * FROM employee
WHERE salary < 60000;

-- IN
SELECT * FROM employee
WHERE department IN ('HR', 'Finance');

-- BETWEEN (inclusive)
SELECT * FROM employee
WHERE salary BETWEEN 45000 AND 55000;

-- LIKE (used with wildcards)
SELECT * FROM employee
WHERE lname LIKE 'P%';   -- Starts with P

-- IS NULL / IS NOT NULL
SELECT * FROM employee
WHERE manager_id IS NULL;

SELECT * FROM employee
WHERE manager_id IS NOT NULL;

-- ================================
-- 3. ARITHMETIC OPERATORS
-- ================================

-- Bonus calculation
SELECT fname, salary, salary * 0.10 AS bonus
FROM employee;

-- Salary increase
SELECT fname, salary, salary + 5000 AS new_salary
FROM employee;

-- ================================
-- 4. STRING SLICING FUNCTIONS
-- ================================

-- First 2 letters of fname
SELECT fname, LEFT(fname, 2) AS first_two
FROM employee;

-- Last 3 letters of fname
SELECT fname, RIGHT(fname, 3) AS last_three
FROM employee;

-- Middle 3 letters from 2nd character
SELECT fname, SUBSTRING(fname, 2, 3) AS mid_chars
FROM employee;

-- ================================
-- 5. WILDCARD PATTERNS WITH LIKE
-- ================================

-- Strings starting with 'F'
SELECT lname FROM employee
WHERE lname LIKE 'F%';

-- Strings ending with 't'
SELECT lname FROM employee
WHERE lname LIKE '%t';

-- Contains substring 'bas'
SELECT lname FROM employee
WHERE lname LIKE '%bas%';

-- 4-letter names with 't' in 3rd position
SELECT lname FROM employee
WHERE lname LIKE '__t_';

-- 11-character strings with dashes in 4th and 7th positions
-- (like '123-45-6789')
SELECT '123-45-6789' AS sample_value
WHERE '123-45-6789' LIKE '___-__-____';

-- Complex wildcard example
SELECT lname FROM employee
WHERE lname LIKE '_a%e%';

-- ================================
-- 6. CONDITIONAL CASE (BONUS)
-- ================================

-- Categorizing salaries
SELECT lname, salary,
  CASE
    WHEN salary >= 55000 THEN 'High'
    WHEN salary >= 45000 THEN 'Medium'
    ELSE 'Low'
  END AS salary_band
FROM employee;

-- ================================
-- End of Filtering Guide
-- ================================
