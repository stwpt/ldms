create or replace procedure proc_adjust_salary(
    p_employee_id	number,
    p_percentage number) is

    v_salary        employees.salary%TYPE;
    v_new_salary    number;
    
    v_usage varchar2(2000) := chr(10)||'USAGE :     proc_adjust_salary(
    p_employee_id => [employee id], 
    p_percentage  => [(+/-)percentage])'||chr(10);

begin
-- check if employee exist
    begin
        select  salary
        into    v_salary
        from    employees
        where   employee_id = p_employee_id;
    end;
    
    v_new_salary := v_salary + (v_salary * p_percentage)/100;
    
    update employees
    set salary = v_new_salary
    where employee_id = p_employee_id;
    commit;
    
    dbms_output.put_line('Employee_id : '||p_employee_id||' Old Salary : '||v_salary||' New Salary : '||v_new_salary);
exception
    when others then
        raise_application_error(-20000,'Backtrace => '||dbms_utility.format_error_backtrace||chr(10)||SQLCODE|| '-' ||SQLERRM||' '||v_usage);
end;
/