create or replace procedure proc_transfer_dept(
    p_employee_id	    number,
    p_department_id     number) is

    v_department_id        employees.department_id%TYPE;
    v_new_department_id    number;

    v_usage varchar2(2000) := chr(10)||'USAGE :     proc_transfer_dept(
    p_employee_id => [employee id], 
    p_department_id => [department_id]';

begin

    select  department_id
    into    v_department_id
    from    employees
    where   employee_id = p_employee_id;

    select  department_id
    into    v_new_department_id
    from    departments
    where   department_id = p_department_id;

    update employees
    set department_id = p_department_id
    where employee_id = p_employee_id;
    commit;

    dbms_output.put_line('Employee_id : '||p_employee_id||' Old Department : '||v_department_id||' New Department : '||p_department_id);
exception
    when others then
        raise_application_error(-20000,'Backtrace => '||dbms_utility.format_error_backtrace||chr(10)||SQLCODE|| '-' ||SQLERRM||' '||v_usage);
end;
/