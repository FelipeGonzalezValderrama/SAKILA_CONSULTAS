-- 1. Actores que tienen de primer nombre ‘Scarlett’.
select * from actor
where first_name = "Scarlett";
-- 2. Actores que tienen de apellido ‘Johansson’.
select * from actor
where last_name = "Johansson";
-- 3. Actores que contengan una ‘O’ en su nombre.
SELECT * FROM actor
where first_name like "%o%";
-- 4. Actores que contengan una ‘O’ en su nombre y en una ‘A’ en su apellido.
SELECT * FROM actor
where first_name like "%o%" and last_name like "%a%";
-- 6. Actores donde su tercera letra sea ‘B’.
SELECT *
FROM actor
WHERE first_name like "__b%";
-- 7. Ciudades que empiezan por ‘a’.
SELECT * FROM city
WHERE city like "a%";
-- 8. Ciudades que acaban por ‘s’.
SELECT * FROM city
WHERE city like "%s";
-- 9. Ciudades del country 61.
SELECT * FROM city
WHERE country_id = 61;
-- 10. Ciudades del country ‘Spain’.
SELECT * FROM city
WHERE country_id = (SELECT country_id FROM country where country="spain");
-- 11. Ciudades con nombres compuestos.
SELECT * FROM city
WHERE city like "% %";
-- 12. Películas con una duración entre 80 y 100.
SELECT * FROM film
WHERE length BETWEEN 80 and 100;
-- 13. Peliculas con un rental_rate entre 1 y 3.
SELECT * FROM film 
WHERE rental_rate BETWEEN 1 and 3;
-- 14. Películas con un titulo de más de 12 letras.
SELECT title FROM film 
WHERE LENGTH(title) >= 12;
-- 15. Peliculas con un rating de PG o G.
SELECT * FROM film
WHERE rating = "PG" OR rating = "G";
-- 16. Peliculas que no tengan un rating de NC-17.
SELECT * FROM film 
WHERE rating != "NC-17";
-- 17. Peliculas con un rating PG y duracion de más de 120.
SELECT * FROM film 
WHERE rating = "PG" AND length >= 120;
-- 18. ¿Cuantos actores hay?
SELECT COUNT(actor_id) FROM actor;
-- 19. ¿Cuántas ciudades tiene el country ‘Spain’?
SELECT COUNT(country_id) AS country_SPAIN
FROM city 
WHERE country_id = (SELECT country_id FROM country where country="spain");
-- ¿Cuántos countries hay que empiezan por ‘a’?
SELECT count(country_id) AS Countrys_empiezan_con_a
FROM Country
WHERE country like "a%";
-- 21. Media de duración de peliculas con PG.
SELECT AVG(length) AS media_duracion_pg FROM film
WHERE rating = "PG";
-- 22. Suma de rental_rate de todas las peliculas.
SELECT sum(rental_rate) AS suma_rental_rate 
FROM film;
-- 23. Pelicula con mayor duración.
SELECT max(length) AS peli_mayor_lenght
FROM film;
-- 24. Película con menor duración.
SELECT min(length) AS peli_menor_lenght
FROM film;
-- 25. Mostrar las ciudades del country Spain (multitabla).
SELECT country.country AS Pais, city.city AS ciudad
FROM country
INNER JOIN city ON country.country_id = city.country_id
WHERE country.country = 'Spain';
-- 26. Mostrar el nombre de la película y el nombre de los actores.
SELECT film.title AS nombre_movie, actor.first_name AS nombre, actor.last_name AS apellido
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON actor.actor_id = film_actor.actor_id
ORDER BY film.title;
-- 27. Mostrar el nombre de la película y el de sus categorías.
SELECT film.title AS titulo_pelicula, category.name AS categoria
FROM film
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON  film_category.category_id =category.category_id
ORDER BY film.title;
-- 28. Mostrar el country, la ciudad y dirección de cada miembro del staff.
SELECT country.country AS Pais, city.city AS ciudad, address.address AS direccion, staff.first_name AS nombre, staff.last_name AS Apellido
FROM country
INNER JOIN city ON city.country_id = country.country_id
INNER JOIN address ON city.city_id = address.city_id
INNER JOIN staff ON address.address_id = staff.address_id
ORDER BY country.country;
-- 29. Mostrar el country, la ciudad y dirección de cada customer.
SELECT country.country AS Pais, city.city AS ciudad, address.address AS direccion_customer
FROM country
INNER JOIN city ON city.country_id = country.country_id
INNER JOIN address ON city.city_id = address.city_id
INNER JOIN customer ON address.address_id = customer.address_id
ORDER BY country.country;
-- 30. Numero de películas de cada rating
SELECT count(rating) AS numero_de_peliculas_cada_rating, rating
FROM film
GROUP BY rating
ORDER BY count(rating);
-- 31. Cuantas películas ha realizado el actor ED CHASE.
SELECT count(*) AS numero_peliculas_actor_ed_chase
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON film_actor.actor_id = actor.actor_id 
WHERE actor.first_name = "ED" AND actor.last_name = "CHASE";
-- 32. Media de duración de las películas cada categoría.
SELECT avg(film.length) AS duracion_peliculas_categorias, category.name AS categorias
FROM film
INNER JOIN film_category ON film_category.film_id = film.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY avg(film.length) ASC; 



