
-- 1. Write a SQL query to count the number of characters except the spaces for each actor. Return first 10 actors name length along with their name.

SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Full Name',
    LENGTH(first_name) + LENGTH(last_name) AS 'Full Name Length'
FROM
    actor;


-- 2. Return first 10 actors name length along with their name.

SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Actor Name',
    LENGTH(first_name) + LENGTH(last_name) + 1 AS 'Name Length'
FROM
    actor
LIMIT 10;

-- 3. List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names.

SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Actor Name',
    LENGTH(first_name) + LENGTH(last_name) + 1 AS 'Full Name Length'
FROM
    actor_award
WHERE
    awards LIKE '%OSCAR%';
    
-- REGEXP Method

SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Actor Name',
    LENGTH(first_name) + LENGTH(last_name) + 1 AS 'Full Name Length'
FROM
    actor_award
WHERE
    awards REGEXP 'OSCAR';


-- 4. Find the actors who have acted in the film 'Frost Head'.

SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS 'Actor Name'
FROM
    film_actor fa
        JOIN
    actor a ON fa.actor_id = a.actor_id
        JOIN
    film f ON fa.film_id = f.film_id
WHERE
    f.title = 'FROST HEAD';


-- 5. Pull all the films acted by the actor 'Will Wilson'.

SELECT 
    f.title
FROM
    film_actor fa
        JOIN
    actor a ON fa.actor_id = a.actor_id
        JOIN
    film f ON fa.film_id = f.film_id
WHERE
    CONCAT(a.first_name, ' ', last_name) = 'Will Wilson';


-- 6. Pull all the films which were rented and return in the month of May.

SELECT 
    f.title AS 'Films'
FROM
    inventory i
        JOIN
    rental r ON i.inventory_id = r.inventory_id
        JOIN
    film f ON i.film_id = f.film_id
WHERE
    r.rental_date BETWEEN '2005-05-01 00:00:00' AND '2005-05-31 23:59:59'
        AND r.return_date BETWEEN '2005-05-01 00:00:00' AND '2005-05-31 23:59:59';
        


-- 7. Pull all the films with 'Comedy' category.

SELECT 
    f.title
FROM
    film_category fc
        JOIN
    film f ON fc.film_id = f.film_id
        JOIN
    category c ON fc.category_id = c.category_id
WHERE
    c.name = 'Comedy'; 
 