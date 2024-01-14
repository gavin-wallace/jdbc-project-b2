select *
from EMPLOYEES;

select JOB_ID
from EMPLOYEES
where SALARY > 5000
group by JOB_ID;

select JOB_ID, AVG(SALARY)
from EMPLOYEES
group by JOB_ID
having AVG(SALARY) > 5000;

select DEPARTMENT_ID, count(*) from EMPLOYEES
group by DEPARTMENT_ID
having count(*) > 5;

select FIRST_NAME, count(*) as "TOTAL COUNT" from EMPLOYEES
group by FIRST_NAME
having count(FIRST_NAME) > 1;

