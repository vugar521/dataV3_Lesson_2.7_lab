-- Lab | SQL Join (Part I)
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
use sakila;
select * from film_category; -- film_id
select * from film;  --
-- film_id common column

select fc.category_id, count(f.film_id) as films_per_categorie
from film as f
join film_category as fc on f.film_id = fc.film_id
group by fc.category_id
;

-- 2.Display the total amount rung up by each staff member in August of 2005.  I do not find where is rung up in table

select * from staff; 
select * from store; 

SELECT s.staff_id, SUM(amount) AS total_amount
FROM staff AS s
LEFT JOIN payment AS p
ON s.staff_id = p.staff_id
WHERE year(payment_date) = 2005
GROUP BY s.staff_id;



-- 3.Which actor has appeared in the most films?
select * from actor;
select a.actor_id, a.first_name, a.last_name, count(a.actor_id) as film_count
from actor as a 
join film_actor as f on a.actor_id = f.actor_id
group by a.actor_id
order by film_count desc
limit 1;

-- 4. Most active customer (the customer that has rented the most number of films)
select * from customer;
select * from rental;

select c.customer_id, c.first_name, c.last_name, count(c.customer_id) as rented_most
from customer as c
join rental as r on c.customer_id = r.customer_id
group by customer_id
order by rented_most
limit 1
;


-- 5. Display the first and last names, as well as the address, of each staff member.
select * from staff;
select * from address;

select s.staff_id, s.first_name, s.last_name, a.address from staff as s
join address as a on s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.
select * from film;
select * from film_actor;  -- common film_id

select fa.film_id, f.title, f.description, count(actor_id) as actor
from film_actor as fa
join film as f on fa.film_id = f.film_id
group by f.film_id
order by actor;


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select * from payment;
select * from customer;

select c.last_name, c.first_name, c.customer_id, sum(amount) as total_paid
from payment as p
join customer as c on p.customer_id = c.customer_id
group by c.customer_id
order by c.last_name ASC
;


-- 8. List number of films per category.
select * from film;
select * from film_category;
-- common column = film_id

select * from category; -- second join with category_id

select fc.category_id,c.name, count(f.film_id) as films
from film_category as fc
join film as f on fc.film_id = f.film_id
join category as c on fc.category_id = c.category_id
group by fc.category_id
;

