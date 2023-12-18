--Verify Data Was imported correctly to each table

-- Select*
-- from "Departments"
-- ;

-- Select*
-- from "Dept_Emp"
-- ;

-- Select*
-- from "Dept_Managers"
-- ;

-- Select*
-- from "Titles"
-- ;

-- Select *
-- from "Employees"
-- ;

-- Select*
-- from "Salaries"
-- ;

---------------------------------------------------------------------------------------------------------------------------------------------
                                                         --Data Analysis--
---------------------------------------------------------------------------------------------------------------------------------------------

---List the employee number, last name, first name, sex, and salary of each employee.

Select "Employees"."emp_no" as "Employee Number","last_name" as "Last Name","first_name" as "First Name","sex" as "Sex","salary" as "Salary"
from "Employees"
inner join "Salaries"
on "Employees"."emp_no" = "Salaries"."emp_no"
;

--List the first name, last name, and hire date for the employees who were hired in 1986.
Select "first_name" as "First Name","last_name" as "Last Name","hire_date" as "Hire Date"
from "Employees"
where "hire_date" Between '1986-01-01' and '1986-12-31'
order by "hire_date"
;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select "Dept_Managers"."dept_no" as "Department Number","Departments"."dept_name" as "Department Name",
"Employees"."emp_no" as "Employee Number","Employees"."last_name" as "Last Name","Employees"."first_name" as "First Name"
from "Dept_Managers"
inner join "Employees"
on "Employees"."emp_no" = "Dept_Managers"."emp_no"
inner join "Departments"
on "Departments"."dept_no" = "Dept_Managers"."dept_no"
;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select "DEMP"."dept_no" as "Department Number","E"."emp_no" as "Employee Number", 
"E"."last_name" as "Last Name","E"."first_name" as "First_Name","D"."dept_name" as "Department Name"
from "Employees" as "E"
inner join "Dept_Emp" as "DEMP"
on "E"."emp_no" = "DEMP"."emp_no"
inner join "Departments" as "D"
on "D"."dept_no" = "DEMP"."dept_no"
;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select "first_name" as "First Name", "last_name" as "Last Name", "sex" as "Sex"
from "Employees"
where "first_name" = 'Hercules'
and "last_name" like 'B%'
;

--List each employee in the Sales department, including their employee number, last name, and first name.
Select "D"."dept_name" as "Department Name","E"."emp_no" as "Employee Number", 
"E"."last_name" as "Last Name","E"."first_name" as "First_Name"
from "Employees" as "E"
inner join "Dept_Emp" as "DEMP"
on "E"."emp_no" = "DEMP"."emp_no"
inner join "Departments" as "D"
on "D"."dept_no" = "DEMP"."dept_no"
where "D"."dept_name" = 'Sales'
;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select "E"."emp_no" as "Employee Number", "E"."last_name" as "Last Name",
"E"."first_name" as "First_Name","D"."dept_name" as "Department Name"
from "Employees" as "E"
inner join "Dept_Emp" as "DEMP"
on "E"."emp_no" = "DEMP"."emp_no"
inner join "Departments" as "D"
on "D"."dept_no" = "DEMP"."dept_no"
where "D"."dept_name" = 'Sales'
or "D"."dept_name" = 'Development'
;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select count ("last_name") as "Count of Last Name", "last_name" as "Last Name"
from "Employees"
group by "Last Name"
order by "Count of Last Name" desc
;












