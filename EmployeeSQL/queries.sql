-- List the employee number, last name, first name, sex, and salary of each employee
SELECT 
    emp_no, last_name, first_name, gender, salary
FROM 
    Employees 
INNER JOIN 
    Salaries ON Employees.emp_no = Salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT 
    first_name, last_name, hire_date
FROM 
    Employees
WHERE 
    YEAR(hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT 
    dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM 
    dept_manager AS dm
INNER JOIN 
    departments AS d ON dm.dept_no = d.dept_no
INNER JOIN 
    employees AS e ON dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT 
    e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM 
    employees AS e
INNER JOIN 
    dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN 
    departments AS d ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT 
    first_name, last_name, gender
FROM 
    Employees
WHERE 
    first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT 
    e.emp_no, e.last_name, e.first_name
FROM 
    employees AS e
INNER JOIN 
    dept_emp AS de ON e.emp_no = de.emp_no
WHERE 
    de.dept_no = (SELECT dept_no FROM departments WHERE dept_name = 'Sales');

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT 
    e.emp_no, e.last_name, e.first_name, d.dept_name
FROM 
    employees AS e
INNER JOIN 
    dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN 
    departments AS d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names
SELECT 
    last_name, COUNT(*) AS frequency
FROM 
    Employees
GROUP BY 
    last_name
ORDER BY 
    frequency DESC;
