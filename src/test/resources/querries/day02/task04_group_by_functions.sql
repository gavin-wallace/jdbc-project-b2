select *
from EMPLOYEES;

select distinct JOB_ID
from EMPLOYEES;

select *
from EMPLOYEES
where JOB_ID = 'IT_PROG';

select AVG(SALARY)
from EMPLOYEES
where JOB_ID = 'IT_PROG';

select MAX(SALARY)
from EMPLOYEES
where JOB_ID = 'IT_PROG';

select MIN(SALARY)
from EMPLOYEES
where JOB_ID = 'IT_PROG';

select AVG(SALARY)
from EMPLOYEES
where JOB_ID = 'SA_REP';


select JOB_ID from EMPLOYEES
group by JOB_ID;

select JOB_ID, MAX(SALARY), MIN(SALARY), AVG(SALARY) from EMPLOYEES
group by JOB_ID;


select DEPARTMENT_ID, SUM(SALARY) from EMPLOYEES
group by DEPARTMENT_ID;

