CREATE OR REPLACE FUNCTION ALPHA()
DECLARE
   lv_lname VARCHAR2(15);
BEGIN
   SELECT sal/age INTO average_sal_by_age
   FROM employees
   WHERE first_name = 'John';

   EXCEPTION
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE (' Your SELECT statement retrieved multiple rows');
	WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE (' DIvision by zero not allowed');

--SELECT * FROM EMP;
	   
END;
     