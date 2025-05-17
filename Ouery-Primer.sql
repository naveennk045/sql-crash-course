-- 1. SELECT all columns and rows
SELECT * 
FROM department;

-- 2. SELECT specific columns
SELECT dept_id, name 
FROM department;

-- 3. SELECT with literal, expression, and function
SELECT emp_id,
       'ACTIVE' AS status,
       emp_id * 3.14159 AS pi_multiple,
       UPPER(lname) AS lname_upper
FROM employee;

-- 4. SELECT DISTINCT (removing duplicates)
SELECT DISTINCT title 
FROM employee;

-- 5. FROM clause with subquery (temporary table)
SELECT e.emp_id, e.fname, e.lname
FROM (
    SELECT emp_id, fname, lname, start_date, title
    FROM employee
) AS e;

-- 6. CREATE VIEW (virtual table)
CREATE VIEW employee_vw AS
SELECT emp_id, fname, lname, 
       YEAR(start_date) AS start_year
FROM employee;

-- 7. SELECT from VIEW
SELECT emp_id, start_year 
FROM employee_vw;

-- 8. WHERE clause (filtering rows)
SELECT emp_id, fname, lname, start_date, title
FROM employee
WHERE title = 'Head Teller';

-- 9. GROUP BY with HAVING
SELECT title, COUNT(*) AS count_by_title
FROM employee
WHERE start_date > '2005-01-01'
GROUP BY title
HAVING COUNT(*) > 2;

-- 10. ORDER BY clause - ascending and descending
SELECT emp_id, fname, lname, start_date
FROM employee
ORDER BY start_date DESC;

-- 11. ORDER BY with expression
SELECT cust_id, fed_id
FROM customer
ORDER BY RIGHT(fed_id, 3);

-- 12. ORDER BY with numeric placeholders
SELECT emp_id, title, start_date, fname, lname
FROM employee
ORDER BY 2, 5;
