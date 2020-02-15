SELECT * FROM department
SELECT * FROM employees
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM salaries
SELECT * FROM titles

--Q1：List details of each employee: 
--employee number, last name, first name, gender, salary
SELECT e.emp_no,e.last_name,e.first_name,e.gender,s.salary 
FROM employees AS e
JOIN salaries AS s
ON e.emp_no=s.emp_no
ORDER BY s.salary DESC;

--Q2:List employee who were hired in 1986
SELECT emp_no, first_name, last_name,hire_date 
FROM employees
WHERE hire_date between '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;

--Q3:List the manager of each department with the following information: 
--department number, 
--department name, 
--the manager's employee number, 
--last name, 
--first name, 
--and start and end employment dates.
SELECT m.dept_no,d.dept_name,m.emp_no,e.last_name,e.first_name,m.from_date, m.to_date
FROM dept_manager AS m
LEFT JOIN employees AS e
ON m.emp_no=e.emp_no
	LEFT JOIN department AS d
	ON m.dept_no=d.dept_no
ORDER BY m.from_date ASC;

--Q4:List the department of each employee with the following information: 
--employee number, 
--last name, 
--first name, 
--and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp AS de
JOIN department AS d
on d.dept_no=de.dept_no
	JOIN employees AS e
	ON e.emp_no=de.emp_no
ORDER BY d.dept_name ASC;

--Q5: List all employees 
--whose first name is "Hercules" 
--and last names begin with "B."
SELECT emp_no, first_name, last_name 
FROM employees
WHERE first_name='Hercules' AND last_name like 'B%';

--Q6: List all employees in the Sales department, 
--including their employee number, 
--last name, 
--first name, 
--and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp AS de
JOIN department AS d
ON d.dept_no=de.dept_no
	JOIN employees AS e
	ON e.emp_no=de.emp_no
WHERE d.dept_name ='Sales';

--Q7:List all employees in the Sales and Development departments, 
--including their employee number, 
--last name, 
--first name, 
--and department name..
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp AS de
JOIN department AS d
on d.dept_no=de.dept_no
	JOIN employees AS e
	ON e.emp_no=de.emp_no
WHERE d.dept_name IN ('Sales', 'Development');

--Q8:In descending order, 
--list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(emp_no)
FROM employees 
GROUP BY last_name
ORDER BY COUNT(emp_no) DESC;
