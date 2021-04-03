select first_name,email from employees
where department='Tools'
and gender='F'
and salary >110000

select * from employees

select first_name,hire_date from employees
where hire_date between '2002-01-01' and '2004-01-01';

select * from employees

where (salary between 40000 and 100000)
and gender='M'
and department='Automotive'
or (gender='F' and department='Toys')
order by department desc;

----------

select * from employees
order by employee_id desc;

select distinct department 
from employees 
order by 1
limit 10;

select distinct department 
from employees 
order by 1
fetch first 10 rows only;

select student_name from students
where age between 18 and 20;

select student_name from students
where student_name like'%ch%'
or student_name like '%nd';

select student_name from students
where (student_name like'%ae%'
or student_name like '%ph%')
and not age > 19;

select student_name from students
order by age desc
limit 4;

select * from students
where (not age > 20 and student_no between 3 and 5
or student_no = 7)
or (age > 20 and student_no > 4 );

select max(salary) from employees;
select min(salary) from employees;
select avg(salary) from employees;
select round(avg(salary)) from employees;
				 
select count(email) from employees;
select sum(salary) from empolyees;

select sum(salary) from employees 
where department= 'Clothing';

select * from professors where last_name='Wilson';
select max(salary), min(salary) from professors where last_name!='Wilson'; 

select min(hire_date) from professors;
				 
select first_name, count(*) as numbers from employees
group by first_name
having count(*) >1				 
order by numbers desc;
				 
select department from employees 
group by department;
				 
select substring(email,position('@'in email)+1) as email_domain,
count(*)
from employees
where email is not null
group by email_domain;
									  
select gender,region_id, 
min(salary) min_salary,max(salary) 
max_salary,avg(salary) avg_salary
from employees
group by gender,region_id
order by gender, region_id;

select state from fruit_imports
order by supply desc
limit 1;
				 
select cost_per_unit,season from fruit_imports
group by season,cost_per_unit
order by cost_per_unit desc
limit 2;

select state from fruit_imports
group by state
having count(name)>1;
				 
				 
select state from fruit_imports
group by state
having count(name)>1;
				 

select season,name from fruit_imports
group by season
having count(name)>3 or count(name)>4;

select state,sum(cost_per_unit*supply) as total_sum from fruit_imports
group by state;
				 
CREATE table fruits (fruit_name varchar(10));
INSERT INTO fruits VALUES ('Orange');
INSERT INTO fruits VALUES ('Apple');
INSERT INTO fruits VALUES (NULL);
INSERT INTO fruits VALUES (NULL);
										
select count(COALESCE(fruit_name)) from fruits;
					  
select * from employees where department in(select department from departments where division='Electronics')
select * from employees where region_id 
in(select region_id from regions where country='Asia' or country='Canada') and salary >150000
					  
select * from employees where region_id 
in(select region_id from regions where country='Asia' or country='Canada');
					  
select * from employees where region_id 
in(select region_id from regions where country='Asia' or country='Canada') and salary >150000
					  
select avg(salary) from employees where employee_id
not in(select employee_id from employees group by employee_id having (salary < max(salary) or salary >min(salary)))
group by salary;

select student_name from students where student_no in (select student_no from student_enrollment where course_no in(select course_no from courses where course_title='Physics' or course_title='US History'));

select student_name from students  																											
where student_no =(select course_no,count() from student_enrollment group by course_no order by course_no desc);

select student_name from students where age (select student_name from students where age =max(age));

																													
SELECT student_name 
FROM students 
WHERE student_no 
IN (
    SELECT student_no FROM (
        SELECT student_no, COUNT(course_no) course_cnt
        FROM STUDENT_ENROLLMENT
        GROUP BY student_no
        ORDER BY course_cnt desc
        LIMIT 1
    )a
)
SELECT *
FROM students
WHERE age = (SELECT MAX(age) FROM students)
																							  
																							  
																													
				 