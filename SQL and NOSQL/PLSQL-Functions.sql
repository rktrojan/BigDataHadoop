
-- Function to calculate average salary by age for employee 'John'
CREATE OR REPLACE FUNCTION ALPHA()
DECLARE
    lv_lname VARCHAR2(15);  -- Local variable (not used in this example)
BEGIN
    -- Select salary divided by age for 'John' into a variable
    SELECT sal/age INTO average_sal_by_age
    FROM employees
    WHERE first_name = 'John';

    -- Exception handling for possible errors
    EXCEPTION
        -- Handles case when SELECT returns more than one row
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows');
        -- Handles division by zero error
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE ('Division by zero not allowed');

    -- Example: Uncomment to select all employees
    -- SELECT * FROM EMP;

    -- End of the ALPHA function
END;
     