set echo off
ttitle center 'Employee Report' SKIP 1
set heading on
SET PAGESIZE 33
SET LINESIZE 140
SET FEEDBACK off
BREAK ON department_name
column department_name heading "Department Name" format a30
column employee_id heading "Department Name" format a11
column employee_name heading "Employee Name" format a30
column job_title heading "Job title" format a15
column manager_name heading "Manager Name" format a30
column date_hired heading "Date Hired" format a10
column salary heading "Salary" format a7
select 
    department_name,
    emp1.employee_id,
    emp1.employee_name,
    emp1.job_title,
    emp2.employee_name as manager_name,
    emp1.date_hired,
    emp1.salary
from employees emp1
join departments on (emp1.department_id = departments.department_id)
left outer join employees emp2 on (emp1.manager_id = emp2.employee_id)
order by department_name,employee_id;