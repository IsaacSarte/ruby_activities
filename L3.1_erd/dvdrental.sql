--  1. /////////////////////////////////////////////////////////

-- Display the number of unique inventory rented and the total number of inventory rented

SELECT * FROM inventory;

-- It should be 16044 rented in total 

SELECT * FROM rental;

SELECT
-- i-Distinct lang yung inventory_id para mawala duplications
COUNT(DISTINCT inventory_id) unique_inventory_rented,
COUNT(inventory_id) total_inventory_rented
FROM
rental r;

--  2. /////////////////////////////////////////////////////////

-- List all the films of Dan Torn and Dan Streep. Sort by film_title alphabetical order

SELECT title FROM film;
SELECT * FROM actor;
SELECT * FROM film_actor;

-- Getting the actor_id of the required names to make it easier to join

SELECT * FROM actor WHERE last_name = 'Streep' AND first_name = 'Dan';
SELECT * FROM actor WHERE last_name = 'Torn' AND first_name = 'Dan';

-- Joining the required columns

SELECT
f.title film_title, f.release_year release_year, concat(UPPER(a.last_name), ', ', a.first_name) actor_full_name
FROM film f
LEFT JOIN film_actor fa ON fa.film_id = f.film_id
LEFT JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.actor_id = 18 OR a.actor_id = 116
ORDER BY f.title;

--  3. /////////////////////////////////////////////////////////

-- List all Comedy films of all actors whose last names start with 'D'. Sort by actor_full_name alphabetical order

SELECT * FROM category;
SELECT * FROM film_category;
SELECT * FROM film;
SELECT * FROM actor;
SELECT * FROM film_actor;

-- Selecting the last name that starts with 'D'

SELECT * FROM actor WHERE last_name LIKE 'D%';

-- Getting the id of Comedy category

SELECT * FROM category where name = 'Comedy';

-- Joing the required columns

SELECT
-- Concatination of last_name and first_name
concat(UPPER(a.last_name), ', ', a.first_name) actor_full_name,
f.title film_tile, c.name category_name
FROM film f
LEFT JOIN film_category fc ON fc.film_id = f.film_id
LEFT JOIN category c ON c.category_id = fc.category_id
LEFT JOIN film_actor fa ON fa.film_id = fc.film_id
LEFT JOIN actor a ON a.actor_id = fa.actor_id
-- id comes from the select above
WHERE c.category_id = 5 AND a.last_name LIKE 'D%'
ORDER BY concat(a.last_name,', ', a.first_name);

--  4. /////////////////////////////////////////////////////////

-- Determine the potential number of customers a store staff would serve (count the number of customer in the same country as the staff)

SELECT * FROM customer;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM store;

-- Joing the required columns

SELECT
concat(st.last_name,', ', st.first_name) staff_full_name,
COUNT(co.country) customer_count
FROM customer cu
LEFT JOIN payment pa ON pa.customer_id = cu.customer_id
LEFT JOIN staff st ON st.staff_id = pa.staff_id
LEFT JOIN address ad ON ad.address_id = st.address_id
LEFT JOIN city ci ON ci.city_id = ad.city_id
LEFT JOIN country co ON co.country_id = ci.country_id
GROUP BY co.country, concat(st.last_name,', ', st.first_name)
ORDER BY co.country;

--  5. /////////////////////////////////////////////////////////

-- Find the most popular film category per store (determined by the number of rentals)

SELECT * FROM film_category;
SELECT * FROM store;

-- Joing the required columns

SELECT
s.store_id, 
COUNT(f.title) film_count,  c.name category_name
FROM rental r
LEFT JOIN inventory i ON i.inventory_id = r.inventory_id
LEFT JOIN film f ON f.film_id = i.film_id
LEFT JOIN film_category fc ON fc.film_id= f.film_id
LEFT JOIN category c ON c.category_id = fc.category_id
LEFT JOIN staff s ON s.staff_id = r.staff_id
LEFT JOIN store st ON st.store_id = s.store_id
GROUP BY s.store_id, c.name
HAVING COUNT(f.title) = 
(
-- Sub Query para mapakita yung each store_id
      SELECT MAX(a.film_count) FROM (
      SELECT
          COUNT(f.title) film_count, s.store_id, c.name
         FROM rental r
         LEFT JOIN inventory i ON i.inventory_id = r.inventory_id
         LEFT JOIN film f ON f.film_id = i.film_id
         LEFT JOIN film_category fc ON fc.film_id= f.film_id
         LEFT JOIN category c ON c.category_id = fc.category_id
         LEFT JOIN staff s ON s.staff_id = r.staff_id
         LEFT JOIN store st ON st.store_id = s.store_id
         GROUP BY s.store_id, c.name
      ) a WHERE a.store_id = 1

 ) 
-- Or gagamitin para yung dalawang store_id mapakita
OR COUNT(f.title) = 
  (
          SELECT MAX(a.film_count) FROM (
          SELECT
          COUNT(f.title) film_count, s.store_id, c.name
          FROM rental r
          LEFT JOIN inventory i ON i.inventory_id = r.inventory_id
          LEFT JOIN film f ON f.film_id = i.film_id
          LEFT JOIN film_category fc ON fc.film_id= f.film_id
          LEFT JOIN category c ON c.category_id = fc.category_id
          LEFT JOIN staff s ON s.staff_id = r.staff_id
          LEFT JOIN store st ON st.store_id = s.store_id
          GROUP BY s.store_id, c.name
         ) a WHERE a.store_id = 2
  )
ORDER BY s.store_id;

--  6. /////////////////////////////////////////////////////////

-- Rank the top 5 actors per country (determined by the number rentals) sort by most popular to least popular

SELECT
a.country, a.actor_full_name, a.actor_rank, a.rental_count 
FROM (
SELECT
co.country country, 
concat(a.last_name,', ', a.first_name) actor_full_name,  
COUNT(r.rental_id) rental_count, 
RANK() OVER ( 
	PARTITION BY co.country 
	ORDER BY COUNT(r.rental_id) DESC
) actor_rank
FROM rental r
LEFT JOIN inventory i ON i.inventory_id = r.inventory_id
LEFT JOIN film f ON f.film_id = i.film_id
LEFT JOIN film_actor fa ON fa.film_id = f.film_id
LEFT JOIN actor a ON a.actor_id = fa.actor_id
LEFT JOIN staff s ON s.staff_id = r.staff_id
LEFT JOIN address ad ON ad.address_id = s.address_id
LEFT JOIN city c ON c.city_id = ad.city_id
LEFT JOIN country co ON co.country_id = c.country_id
GROUP BY a.last_name, a.first_name, co.country
) a
	WHERE a.actor_rank <= 5