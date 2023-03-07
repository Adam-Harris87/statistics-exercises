use employees;
show tables;
select avg(salary), stddev(salary) from salaries where to_date > now();

show databases;
use telco_churn;
show tables;
select * from customers;
SELECT * FROM internet_service_types;
select * 
from customers
	join internet_service_types
		using (internet_service_type_id);
select total_charges
from customers;

use employees;
show tables;
SELECT 
	emp_no,
    DATEDIFF(now(), hire_date) as tenure,
    salary
FROM employees
	JOIN salaries
		USING (emp_no)
WHERE to_date > now();

SELECT 
	emp_no, 
    DATEDIFF(now(), hire_date) as tenure,
    COUNT(title)  as title_count
FROM employees
	JOIN titles
		USING (emp_no)
GROUP BY emp_no;

describe dept_emp;
describe departments;

SELECT
	emp_no,
    gender,
    dept_name,
    IF (e.emp_no IN (
		SELECT dm.emp_no
		FROM dept_manager as dm), TRUE, FALSE) as manager 
FROM employees as e
	LEFT JOIN dept_emp de
		USING (emp_no)
	JOIN departments
		USING (dept_no)
	LEFT JOIN dept_manager as dm
		USING (emp_no)
WHERE de.to_date > now();