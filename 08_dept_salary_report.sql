spool dept_salary_report.txt
set echo off
ttitle center 'Total Salary for each Department Report' SKIP 1
set heading on
SET PAGESIZE 33
SET LINESIZE 70
SET FEEDBACK off
column  department_id   heading "Department ID"   format a13
column  department_name heading "Department name" format a40
column  total_salary heading "Total Salary" format a12
select  departments.department_id,
        departments.department_name,
        sum(salary) total_salary
from employees emp1
join departments on (emp1.department_id = departments.department_id)
group by
        departments.department_id,
        departments.department_name
order by 1;
spool off