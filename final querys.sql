SELECT * FROM city
WHERE NOT city LIKE 'a%-%a';

--
SELECT * FROM city
WHERE city LIKE 'a%-%a';

--

SELECT * FROM city
WHERE country_id=87 or city LIKE 'A%';

----

SELECT COUNT(*) FROM city WHERE country_id = 87;

----
SELECT city FROM city WHERE city LIKE 'A%' OR city LIKE 'a%'

---
SELECT * FROM film


--

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id <> ALL (SELECT customer_id
						 FROM rental
						 WHERE return_date is not NULL)
--

SELECT c.customer_id, c.first_name, c.last_name, r.return_date, r.customer_id
FROM customer c, rental r
JOIN rental r ON c.customer_id = r.customer_id;

SELECT * INTO film_high_rate FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

SELECT * FROM film_high_rate;

--
SELECT * FROM customer
WHERE LENGTH(first_name) > ALL(select LENGTH(first_name) from actor);

--******registros de todos los clientes que aun no han llenado su district en el sistema

SELECT first_name, last_name
FROM customer
WHERE address_id <> ALL (
SELECT address_id FROM address WHERE district <>'')

--****filtrar nombre y apellido de aquellos clientes que no registraron su numero de telefono

SELECT first_name, last_name
FROM customer
WHERE address_id <> ALL(
	SELECT address_id
	FROM address
	WHERE phone <> '')

--nombre de actor de las peliculas mas rankeadas y su tipo de genero
-- genero con mayor alquiladas

--cantidad de tiempo alquilada la peli ordenada de mas peque;o a mas grande

SELECT return_date - rental_date AS tiempo_transcurrido
FROM rental
ORDER BY tiempo_transcurrido ASC

-----*****buscar los nombres de las personas que no han entregado pelicula


WITH notreturned AS (
	SELECT customer_id
    FROM rental
    WHERE return_date IS NULL
)
SELECT c.first_name, c.last_name, c.customer_id, p.customer_id
FROM customer c
JOIN notreturned p ON c.customer_id = p.customer_id








