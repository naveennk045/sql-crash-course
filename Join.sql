
-- INNER JOIN
SELECT E.emp_id	,E.emp_name,D.dept_name
FROM Employees AS E
INNER JOIN Departments AS D ON  E.dept_id	= D.dept_id	;

-- LEFT JOIN
SELECT C.customer_id,CONCAT(C.first_name,C.last_name) AS name,O.item,O.amount
FROM  Customers AS C
LEFT JOIN  Orders AS O ON C.customer_id=O.customer_id
ORDER BY C.customer_id;

-- RIGHT JOIN
SELECT S.supplier_id , S. supplier_name , P.product_name
FROM Products AS P
RIGHT JOIN Suppliers AS S ON  S.supplier_id=P.supplier_id;

-- FULL OUTER JOIN using UNION
SELECT students.student_name, courses.course_name
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
LEFT JOIN courses ON enrollments.course_id = courses.course_id

UNION

SELECT students.student_name, courses.course_name
FROM courses
LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
LEFT JOIN students ON enrollments.student_id = students.student_id;


-- CROSS JOIN
SELECT color_name, size_label
FROM colors
CROSS JOIN sizes;

