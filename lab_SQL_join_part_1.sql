USE sakila;


-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * from category;
SELECT * from film_category;

SELECT f.category_id, c.name, COUNT(f.film_id) AS 'number_of_films'
FROM sakila.film_category f
JOIN sakila.category c
ON f.category_id = c.category_id
GROUP BY c.category_id
ORDER BY c.category_id ASC;

-- 2. Display the total amount rung up (how much they sold) by each staff member in August of 2005.

SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS 'Amount_sold'
FROM sakila.payment p
JOIN sakila.staff s
ON s.staff_id = p.staff_id
WHERE LEFT(p.payment_date, 7) = '2005-08'
GROUP BY s.staff_id
ORDER BY s.staff_id ASC;

-- 3. Which actor has appeared in the most films?   
SELECT f.actor_id, a.first_name, a.last_name, COUNT(f.film_id) AS How_many_films
FROM sakila.actor a
JOIN sakila.film_actor f
ON a.actor_id = f.actor_id
GROUP BY f.actor_id
ORDER BY How_many_films DESC;

-- 4. Most active customer (the customer that has rented the most number of films)
-- I choose 5 most active

SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS nr_of_rentals
FROM customer c 
JOIN rental r
ON r.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY nr_of_rentals DESC
LIMIT 5;

-- 5. Display the first and last names, as well as the address, of each staff member.
-- Assumption: Here we are asked only about the stuff members, and not menager for store. 
SELECT s.first_name, s.last_name, a.address
FROM staff s 
JOIN address a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.


-- 8. List the titles of films per category.