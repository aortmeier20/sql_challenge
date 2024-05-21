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




