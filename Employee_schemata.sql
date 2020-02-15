CREATE TABLE department(
	dept_no VARCHAR(30) NOT NULL UNIQUE PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE employees(
	emp_no INT NOT NULL UNIQUE PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(30) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no	VARCHAR(30) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary MONEY NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
	emp_no INT NOT NULL,
	title VARCHAR(30) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);



	


