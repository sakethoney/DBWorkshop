select * from customer where first_name = 'Jared';
select title from film where rental_rate > 4 AND replacement_cost >= 19.99 AND rating='R';
select email from customer where first_name ='Nancy'AND last_name = 'Thomas';
-------------------------
select store_id,first_name,last_name from customer
order by store_id DESC, first_name ASC;
---Not selecting the oderby column 
select first_name,last_name from customer
order by store_id DESC, first_name ASC;

--- Limit is the last command to be executed
select * from payment where amount != 0 order by payment_date desc limit 5;

select customer_id from payment where amount !=0 order by payment_date asc limit 10;

select title from film order by length limit 5;

select count(title) from film where length <=50; 

select * from film limit 2;

-- between is inclusive and not between is exclusive of the end values
select * from payment where payment_date between '2007-02-01' and '2007-02-15';

----group by CLAUSE ----

--equivalent to distinct
select customer_id from payment group by customer_id;

select customer_id, sum(amount)   from payment group by customer_id order by sum(amount);
select customer_id, count(amount) from payment group by customer_id order by count(amount);

select customer_id, staff_id, sum(amount) from payment group by staff_id, customer_id order by customer_id;

--select date with most amount in transaction
select date(payment_date), sum(amount) from payment group by date(payment_date) order by sum(amount)desc;

select count(amount),staff_id from payment where staff_id in(1,2) group by staff_id order by count(amount) desc;

select round(avg(replacement_cost),2)rating from film group by rating order by avg(replacement_cost) desc;

select customer_id, sum(amount) from payment group by customer_id order by sum(amount) desc limit 5;

---HAVING CLAUSE---- it allows to filter after an aggregation has already taken place.
select customer_id, sum(amount) from payment where customer_id not in(87,477) group by customer_id having sum(amount)> 100;
select store_id , count(customer_id) from customer group by store_id;
select store_id , count(*) from customer group by store_id;
select store_id , count(*) from customer group by store_id having count(*)>300;

select customer_id, count(amount) from payment group by customer_id having count(amount)>=40;

select customer_id, sum(amount) from payment where staff_id=2 group by customer_id having sum(amount) >100;

-- Joins----
-- Inner join produces only the set of records that match in both table A and table B. Its like the area of intersection of two circles.
-- full Outer join produces the set of all records in Table A and Table B with matching records from both 
-- sides when available otherwise the missing side will contain null.
-- Left Outer Join produces a complete set of records from Table A with the matching records(where available) in table B. 
-- if thre is no match, the right side will contain null.
select payment_id,payment.customer_id,first_name
from payment inner join customer on payment.customer_id = customer.customer_id;

--left join
select film.film_id,title, inventory_id, store_id from film left join inventory on inventory.film_id = film.film_id
where inventory.film_id is null;

--UNION
select customer_id from customer union select customer_id from payment;
select customer_id from customer union all select customer_id from payment;

select customer.email from customer left join address on customer.address_id = address.address_id where district='California';

--select film.title,first_name, last_name from film where film_id in(select film_id from film_actor left join actor 
--on film_actor.actor_id = actor.actor_id where first_name='Nick' and last_name='Wahlberg');

select title, first_name, last_name from actor inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film_actor.film_id = film.film_id where first_name ='Nick' and last_name ='Wahlberg';


--select actor.first_name, actor.last_name from actor inner join film_actor on actor.actor_id = film_actor.actor_id where actor.first_tname='Nick' and actor.last_name='Wahlberg';

-- subquery

select film_id, title, rating from film where film_id in(
	select inventory .film_id from rental inner join inventory on inventory.inventory_id = rental.inventory_id
    where return_date between '2005-05-29' and '2005-05-30')
group by rating,
order by title;


















