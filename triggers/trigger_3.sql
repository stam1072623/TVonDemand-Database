USE tvondemand;

DROP TRIGGER IF EXISTS restrictUpdate;
DELIMITER $$

CREATE TRIGGER restrictUpdate BEFORE UPDATE ON customer FOR EACH ROW
BEGIN

		IF(NOT(old.customer_id = new.customer_id) OR  NOT (old.address_id = new.address_id) OR NOT (old.active  =  new.active) OR NOT (old.create_date = new.create_date))
        THEN
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'This action is not allowed for customer';
        END IF;
END$$
DELIMITER ;
