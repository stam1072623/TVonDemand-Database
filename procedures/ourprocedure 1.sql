USE tvondemand;
DROP PROCEDURE IF EXISTS getBestSelling;
DELIMITER $$
CREATE PROCEDURE getBestSelling(type CHAR,number INT,before_date DATE,after_date DATE)
BEGIN
   IF( type = 'm')
   THEN
       SELECT film.film_id,film.title,COUNT(film.film_id)
       FROM rental
       INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
       INNER JOIN film ON inventory.film_id = film.film_id
       WHERE rental_date >= before_date AND rental_date <= after_date
       GROUP BY film.film_id
       ORDER BY COUNT(film.film_id) DESC
       LIMIT number;
       END IF;
    
    IF( type = 's')
    THEN
	   SELECT series.series_id,series.title,SUM(rental.episodes)
       FROM rental
       INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
       INNER JOIN series ON inventory.series_id = series.series_id
       WHERE rental_date >= before_date AND rental_date <= after_date
       GROUP BY series.series_id
       ORDER BY SUM(rental.episodes) DESC
       LIMIT number;
	END IF;
END$$
DELIMITER ;

CALL getBestSelling('s',5,'2002-08-21','2021-10-01');