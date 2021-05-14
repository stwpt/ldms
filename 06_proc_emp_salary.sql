create or replace procedure proc_emp_salary(
    p_employee_id	number) is

    v_salary        employees.salary%TYPE;
    v_employee_name employees.employee_name%TYPE;

    v_usage varchar2(2000) := chr(10)||'USAGE :     proc_emp_salary(
    p_employee_id => [employee id])'||chr(10);

begin
    begin
        select  salary,
                employee_name
        into    v_salary,
                v_employee_name
        from    employees
        where   employee_id = p_employee_id;
    end;

    dbms_output.put_line('Employee : '||v_employee_name||' : '||v_salary);
exception
    when others then
        raise_application_error(-20000,'Backtrace => '||dbms_utility.format_error_backtrace||chr(10)||SQLCODE|| '-' ||SQLERRM||' '||v_usage);
end;
/