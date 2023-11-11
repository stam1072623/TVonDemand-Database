USE tvondemand;
DROP TRIGGER IF EXISTS discount;
DELIMITER $$

CREATE TRIGGER discount AFTER INSERT ON rental FOR EACH ROW
BEGIN

DECLARE amnt DEC(5,2);
DECLARE rdate DATE;
DECLARE rid INT;
DECLARE cemail VARCHAR(50);
DECLARE cid INT;
DECLARE samnt DEC(5,2);
SELECT MAX(rental_id) INTO rid FROM rental;
SELECT amount INTO amnt FROM payment WHERE rental_id = rid;
SELECT rental_date INTO rdate FROM rental WHERE rental_id = rid;
SELECT customer_id INTO cid FROM rental WHERE rental_id = rid;
SELECT email INTO cemail FROM customer WHERE customer_id = cid;
CALL getRentalsInDay(cemail,rdate,@rentals);
SET amnt=FLOOR(RAND()*(10-1+1)+1);
SELECT SUM(amount) INTO samnt FROM payment WHERE payment_date = rdate AND customer_id = cid;
IF( @rentals mod 3 = 0 AND NOT @rentals = 0)
THEN
	SET amnt = samnt / 2;
END IF;
INSERT INTO payment (`payment_id`, `customer_id`, `rental_id`, `amount`, `payment_date`) VALUES
(NULL,cid,rid,amnt,rdate);

END$$
DELIMITER ;