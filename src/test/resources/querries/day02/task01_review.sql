SELECT * FROM EMPLOYEES;

-- Display all jobs which job title is "President", "Sales Manager", "Finance Manager"
SELECT * from jobs
WHERE JOB_TITLE = 'President' or JOB_TITLE = 'Sales Manager' or JOB_TITLE = 'Finance Manager';


SELECT * from jobs
WHERE JOB_TITLE IN ('President', 'Sales Manager', 'Finance Manager');


-- Display all Department that does not have manager_id in departments table
SELECT * FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;


--  Display all information from Locations table where COUNTRY_ID in US or UK
SELECT * FROM LOCATIONS
WHERE COUNTRY_ID IN ('US', 'UK');  -- Since we do not have UK, it will not show any matching one

SELECT * FROM LOCATIONS
WHERE COUNTRY_ID = 'US' OR COUNTRY_ID = 'GB';

-- Display all information where country id is not US or GB from Location table
SELECT * FROM LOCATIONS
WHERE COUNTRY_ID NOT IN ('US', 'GB');
--or
SELECT * FROM LOCATIONS
WHERE COUNTRY_ID <> 'US' AND  COUNTRY_ID <> 'GB';
--or
SELECT * FROM LOCATIONS
WHERE COUNTRY_ID != 'US' AND  COUNTRY_ID != 'GB';


-- Display all information where region id is 10 and country name Belgium
SELECT * FROM COUNTRIES
WHERE REGION_ID = 10 AND  COUNTRY_NAME ='Belgium';


-- Display all information where region id is 10 and country name IS NOT Belgium
SELECT * FROM COUNTRIES
WHERE REGION_ID = 10 AND  COUNTRY_NAME !='Belgium'; --      != same as <>


-- Display all information who does not work in any of these department id: 90, 60, 100, 130, 120
SELECT * FROM  EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (90, 60, 100, 130, 120);


-- Display first name and last name who does not work in any of these department id: 90, 60, 100, 130, 120
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (90, 60, 100, 130, 120);
