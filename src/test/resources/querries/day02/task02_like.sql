SELECT * FROM EMPLOYEES;

/*
    LIKE
        % --- > any sequence of character ---- > Jen% ---- > Starts with Jen --- > % refers to 0 or more characters
        % --- > any sequence of character ---- > %fer ---- > Ends with fer --- > % refers to 0 or more characters
 */

-- Display all employees whose first_name starts with B
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B%';

SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B%';

-- Display all info for employees whose first name starts with B and has 5 characters in total
SELECT * from EMPLOYEES
WHERE FIRST_NAME LIKE 'B____';

-- Display 5 letter names where middle character is z
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__z__';

-- Display all info where middle character in fistname is z
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%z%';

-- Display all info who has 5 character long names
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_____';

-- Display all info where the first name 2nd character is a
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_a%';

-- Display last_names whose first name ends with l
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%l';

-- Display any job information with job_title ends with Manager
SELECT * FROM JOBS
WHERE JOB_TITLE LIKE '%Manager';