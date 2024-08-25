-- Create the Department table with a primary key and a unique not null constraint on the department name.
CREATE TABLE Department (
    dept_no VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

-- Create the Titles table with a primary key and a unique not null constraint on the title.
CREATE TABLE Titles (
    title_id VARCHAR(6) PRIMARY KEY,
    title VARCHAR(50) UNIQUE NOT NULL
);

-- Create the Employees table with a primary key, a foreign key to the Titles table, and not null constraints on relevant columns.
CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(6) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

-- Create the Dept_emp table with a composite primary key, foreign keys to the Employees and Department tables, and not null constraints on relevant columns.
CREATE TABLE Dept_emp (
    emp_no INT,
    dept_no VARCHAR(5) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Department (dept_no)
);

-- Create the Dept_manager table with a primary key, foreign keys to the Employees and Department tables, and not null constraints on relevant columns.
CREATE TABLE Dept_manager (
    dept_no VARCHAR(5),
    emp_no INT PRIMARY KEY,
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Department (dept_no)
);

-- Create the Salaries table with a primary key, a foreign key to the Employees table, and a not null constraint on the salary.
CREATE TABLE Salaries (
    emp_no INT,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);
