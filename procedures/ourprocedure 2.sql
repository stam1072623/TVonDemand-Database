USE tvondemand;
DROP PROCEDURE IF EXISTS getRentalsInDay;
DELIMITER $$
CREATE PROCEDURE getRentalsInDay(email VARCHAR(50), date DATE, OUT rentals TINYINT)
BEGIN

SELECT COUNT(rental_id) INTO rentals
FROM CUSTOMER
INNER JOIN rental ON rental.customer_id = customer.customer_id
WHERE DATE(rental.rental_date) = date AND customer.email = email;

END$$
DELIMITER ;

call getRentalsInDay('TASNIM.THOMPSON@sakilacustomer.org','2020-11-17',@rentals);
SELECT @rentals;