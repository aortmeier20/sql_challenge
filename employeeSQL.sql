DROP TABLE titles;
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;



CREATE TABLE "titles" (
	"title_id" VARCHAR(10) NOT NULL,
	"title" VARCHAR(30) NOT NULL,
	CONSTRAINT "pk_titles"		PRIMARY KEY (
		"title_id"))
;

SELECT * FROM titles;


CREATE TABLE "departments" (
	"dept_no" VARCHAR(10) NOT NULL,
	"dept_name" VARCHAR(30) NOT NULL,
	CONSTRAINT "pk_departments"		PRIMARY KEY (
		"dept_no"))
;

SELECT * FROM departments;

CREATE TABLE "dept_emp" (
	"emp_no" INTEGER NOT NULL,
	"dept_no" VARCHAR(10) NOT NULL)
;

SELECT * FROM dept_emp;


CREATE TABLE "dept_manager" (
	"dept_no" VARCHAR(10) NOT NULL,
	"emp_no" INTEGER NOT NULL
)
;


SELECT * FROM dept_manager;


CREATE TABLE "employees" (
	"emp_no" INTEGER NOT NULL,
	"emp_title_id" VARCHAR(10) NOT NULL,
	"birth_date" VARCHAR NOT NULL,
	"first_name" VARCHAR(20) NOT NULL,
	"last_name" VARCHAR(20) NOT NULL,
	"sex" VARCHAR(1) NOT NULL,		
	"hire_date" VARCHAR NOT NULL,
	CONSTRAINT "pk_employees"		PRIMARY KEY (
		"emp_no"))
;

SELECT * FROM employees;

CREATE TABLE "salaries" (
	"emp_no" INTEGER,
	"salary" INTEGER
)
;

SELECT * FROM salaries;

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY ("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");


--List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;



--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'



--List the manager of each department along with their 
--department number, department name, employee number, last name, and first name
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;


--List the department number for each employee 
--along with that employee’s employee number, last name, first name, and department name 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;



--List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';



--List each employee in the Sales department, 
--including their employee number, last name, and first name 
SELECT departments.dept_name, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';


--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development'

--List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name)
SELECT last_name,
COUNT (last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;


