create or replace procedure proc_add_emp(
    p_employee_id	number,
    p_employee_name	varchar2,
    p_job_title		varchar2,
    p_manager_id	number,
    p_date_hired	date,
    p_salary		number,
    p_department_id	number) is
    
    v_usage varchar2(2000) := chr(10)||'USAGE : exec proc_add_emp(
    p_employee_id => [employee id], 
    p_employee_name => [employee name], 
    p_job_title => [job title], 
    p_manager_id => [manager id] or NULL, 
    p_date_hired => [date hired] (date format dd/mm/yyyy), 
    p_salary => [salary], 
    p_department_id => [department_id]'||chr(10);
    
begin
    INSERT INTO employees(
        employee_id,
        employee_name,
        job_title,
        manager_id,
        date_hired,
        salary,
        department_id) 
    values (
        p_employee_id	,
        p_employee_name	,
        p_job_title		,
        p_manager_id	,
        to_date(p_date_hired,'dd/mm/yyyy'),
        p_salary		,
        p_department_id	);
exception
    when others then
        raise_application_error(-20000,'Backtrace => '||dbms_utility.format_error_backtrace||chr(10)||SQLCODE|| '-' ||SQLERRM||' '||v_usage);
end;
/