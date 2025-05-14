-- MYSQL CRUD + ADDITIONAL OPERATIONS SYNTAX (PURE SYNTAX VERSION)

-- 1. CREATE DATABASE
CREATE DATABASE database_name;
USE database_name;

-- 2. CREATE TABLE
CREATE TABLE table_name (
    column1 datatype [constraints],
    column2 datatype [constraints],
    ...
);

-- 3. INSERT DATA
INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);
INSERT INTO table_name VALUES (value1, value2, ...);  -- If all columns are filled

-- 4. SELECT DATA
SELECT * FROM table_name;
SELECT column1, column2 FROM table_name;
SELECT column1 FROM table_name WHERE condition;
SELECT column1 FROM table_name ORDER BY column1 ASC|DESC;
SELECT column1 FROM table_name GROUP BY column1;
SELECT column1, COUNT(*) FROM table_name GROUP BY column1 HAVING COUNT(*) > value;

-- 5. UPDATE DATA
UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;

-- 6. DELETE DATA
DELETE FROM table_name WHERE condition;
DELETE FROM table_name; -- Delete all rows (Use with caution)

-- 7. CREATE VIEW
CREATE VIEW view_name AS
SELECT column1, column2 FROM table_name WHERE condition;

-- 8. CREATE INDEX
CREATE INDEX index_name ON table_name (column1);

-- 9. ALTER TABLE
ALTER TABLE table_name ADD column_name datatype;
ALTER TABLE table_name MODIFY column_name new_datatype;
ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE table_name RENAME TO new_table_name;

-- 10. DROP OPERATIONS
DROP TABLE table_name;
DROP DATABASE database_name;
DROP VIEW view_name;
DROP INDEX index_name ON table_name;

-- 11. CONSTRAINTS (when creating table)
-- PRIMARY KEY
column_name datatype PRIMARY KEY
-- FOREIGN KEY
FOREIGN KEY (column_name) REFERENCES other_table(column_name)
-- NOT NULL
column_name datatype NOT NULL
-- UNIQUE
column_name datatype UNIQUE
-- DEFAULT
column_name datatype DEFAULT default_value
-- CHECK
column_name datatype CHECK (condition)
-- AUTO_INCREMENT
column_name INT AUTO_INCREMENT PRIMARY KEY

-- 12. ENUM (Fixed set of values)
column_name ENUM('value1', 'value2', 'value3')

-- 13. IF NOT EXISTS / IF EXISTS
CREATE TABLE IF NOT EXISTS table_name (...);
DROP TABLE IF EXISTS table_name;

-- 14. TRUNCATE (Remove all rows)
TRUNCATE TABLE table_name;

-- 15. RENAME
RENAME TABLE old_table_name TO new_table_name;

-- 16. USE DATABASE
USE database_name;

-- END OF PURE MYSQL CRUD SYNTAX
