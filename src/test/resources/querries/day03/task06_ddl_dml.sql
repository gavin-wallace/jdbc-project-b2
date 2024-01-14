select * from EMPLOYEES;

create table scrumteam (
    empId number primary key,
    firstname varchar2(20) not null,
    jobtitle varchar2(20) not null,
    age integer,
    salary integer
);

select * from scrumteam;

insert into scrumteam (empId, firstname, jobtitle, age, salary)
values (3,'james','bond',30,140000);

insert into scrumteam (empId,firstname,jobtitle)
values (4,'maya','sdet');

insert into scrumteam (empId,firstname,jobtitle)
values (5,'gavin','qa eng');

commit;

insert into scrumteam
values (5,'gavin','dev',30,150000);

update scrumteam
set salary = salary+5000;

update scrumteam
set salary = salary +5000
where age=30;

delete
from scrumteam
where firstname = 'tom';

select *
from scrumteam;


commit;

alter table scrumteam
add gender varchar2(10);

select * from scrumteam;

alter table scrumteam
rename column salary to annual_salary;

alter table scrumteam
drop column gender;

