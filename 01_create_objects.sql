--
DECLARE
    v_count    number;
BEGIN
    begin
        select count(*)
        into    v_count
        from    user_tables
        where table_name = 'EMPLOYEES';
    exception
        when no_data_found then
            v_count := 0;
    end;
    
    if v_count != 0 then
        execute immediate 'DROP TABLE EMPLOYEES';
    end if;

    begin
        select count(*)
        into    v_count
        from    user_tables
        where table_name = 'DEPARTMENTS';
    exception
        when no_data_found then
            v_count := 0;
    end;
    
    if v_count != 0 then
        execute immediate 'DROP TABLE DEPARTMENTS';
    end if;    
END;
/
--
  CREATE TABLE "LDMS"."DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(5,0) NOT NULL ENABLE, 
	"DEPARTMENT_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"LOCATION" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "DEPARTMENTS_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX
   );

   COMMENT ON COLUMN "LDMS"."DEPARTMENTS"."DEPARTMENT_ID" IS 'The unique identifier for the department';
   COMMENT ON COLUMN "LDMS"."DEPARTMENTS"."DEPARTMENT_NAME" IS 'The name of the department';
   COMMENT ON COLUMN "LDMS"."DEPARTMENTS"."LOCATION" IS 'The physical location of the department';



  CREATE TABLE "LDMS"."EMPLOYEES" 
   ("EMPLOYEE_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"EMPLOYEE_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"JOB_TITLE" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"MANAGER_ID" NUMBER(10,0), 
	"DATE_HIRED" DATE NOT NULL ENABLE, 
	"SALARY" NUMBER(10,0) NOT NULL ENABLE, 
	"DEPARTMENT_ID" NUMBER(5,0) NOT NULL ENABLE, 
	 CONSTRAINT "EMPLOYEES_PK" PRIMARY KEY ("EMPLOYEE_ID") USING INDEX , 
	 CONSTRAINT "DEPARTMENT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "LDMS"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE, 
	 CONSTRAINT "MANAGER_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "LDMS"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE
   );

   COMMENT ON COLUMN "LDMS"."EMPLOYEES"."EMPLOYEE_ID" IS 'The unique identifier for the employee';
   COMMENT ON COLUMN "LDMS"."EMPLOYEES"."EMPLOYEE_NAME" IS 'The name of the employee';
   COMMENT ON COLUMN "LDMS"."EMPLOYEES"."JOB_TITLE" IS 'The job role undertaken by the employee. Some employees may undertaken the same job role';
   COMMENT ON COLUMN "LDMS"."EMPLOYEES"."MANAGER_ID" IS 'Line manager of the employee';
   COMMENT ON COLUMN "LDMS"."EMPLOYEES"."DATE_HIRED" IS 'The date the employee was hired';
   COMMENT ON COLUMN "LDMS"."EMPLOYEES"."SALARY" IS 'Current salary of the employee';
   COMMENT ON COLUMN "LDMS"."EMPLOYEES"."DEPARTMENT_ID" IS 'Each employee must belong to a department';




