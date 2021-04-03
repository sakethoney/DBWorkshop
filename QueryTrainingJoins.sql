select first_name, email, division
from employees, departments
where employees.department=departments.department
and  email is not null;

select first_name, email,e.department, division, country
from employees e, departments d, regions r
where e.department=d.department
and e.region_id=r.region_id
and  email is not null;

select country, count(e.employee_id) total_emp
from employees e, regions r
where e.region_id=r.region_id
group by country;

select first_name, email, division,country 
from employees inner join departments
on employees.department=departments.department
inner join regions on employees.region_id= 
regions.region_id
where email is not null;

select distinct department from employees

select distinct department from  departments

select distinct employees.department employees_department,
departments.department departments_department
from employees right join departments 
on employees.department=departments.department;


select distinct department from employees
where department not in(select distinct departments.department departments_department
from employees right join departments 
on employees.department=departments.department);


select distinct employees.department employees_department,
departments.department departments_department
from employees left join departments 
on employees.department=departments.department
where departments.department is null;

select distinct employees.department employees_department,
departments.department departments_department
from employees full outer join departments 
on employees.department=departments.department

select distinct department
from employees
union
select department
from departments;

select department
from employees
union
select department
from departments;

-- columns must match(it may not be the same column but colums with same datatype) in union and union all queries
select department
from employees
union all
select department
from departments;

select department
from employees
-- order by can not be put between from and union clause
union all
select department
from departments;


select distinct department
from employees
--the except(minus in oracle) operator takes the first resultset 
--and removes all the first resultest from second resultset
except
select distinct department
from departments;

select department, count(employee_id) emp_ids from employees
group by department
union all
select 'Total', count(*) from employees
group by department;









