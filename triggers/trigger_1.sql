USE tvondemand;

DROP TRIGGER IF EXISTS log_rental_insert;
DROP TRIGGER IF EXISTS log_rental_afterinsert;
DROP TRIGGER IF EXISTS log_rental_update;
DROP TRIGGER IF EXISTS log_rental_afterupdate;
DROP TRIGGER IF EXISTS log_rental_delete;
DROP TRIGGER IF EXISTS log_rental_afterdelete;
DROP TRIGGER IF EXISTS log_payment_insert;
DROP TRIGGER IF EXISTS log_payment_afterinsert;
DROP TRIGGER IF EXISTS log_payment_update;
DROP TRIGGER IF EXISTS log_payment_afterupdate;
DROP TRIGGER IF EXISTS log_payment_delete;
DROP TRIGGER IF EXISTS log_payment_afterdelete;


DELIMITER $$

CREATE TRIGGER log_rental_insert BEFORE INSERT ON rental FOR EACH ROW
BEGIN
SET @now = now();
INSERT INTO log(`log_id`,`email`,`datetime`,`success`,`activity`,`target_table`)
VALUES (NULL,@email,@now,'0','INSERT','rental');
END $$

CREATE TRIGGER log_rental_afterinsert AFTER INSERT ON rental FOR EACH ROW
BEGIN
UPDATE log
SET success = 1
WHERE activity = 'INSERT' AND target_table = 'rental' AND email = @email AND datetime = @now;
END $$

CREATE TRIGGER log_rental_update BEFORE UPDATE ON rental FOR EACH ROW
BEGIN
SET @now = now();
INSERT INTO log(`log_id`,`email`,`datetime`,`success`,`activity`,`target_table`)
VALUES (NULL,@email,@now,'0','UPDATE','rental');
END $$

CREATE TRIGGER log_rental_afterupdate AFTER UPDATE ON rental FOR EACH ROW
BEGIN
UPDATE log
SET success = 1
WHERE activity = 'UPDATE' AND target_table = 'rental' AND email = @email AND datetime = @now;
END $$

CREATE TRIGGER log_rental_delete BEFORE DELETE ON rental FOR EACH ROW
BEGIN
SET @now = now();
INSERT INTO log(`log_id`,`email`,`datetime`,`success`,`activity`,`target_table`)
VALUES (NULL,@email,@now,'0','DELETE','rental');
END $$

CREATE TRIGGER log_rental_afterdelete AFTER DELETE ON rental FOR EACH ROW
BEGIN
UPDATE log
SET success = 1
WHERE activity = 'DELETE' AND target_table = 'rental' AND email = @email AND datetime = @now;
END $$

CREATE TRIGGER log_payment_insert BEFORE INSERT ON payment FOR EACH ROW
BEGIN
SET @now = now();
INSERT INTO log(`log_id`,`email`,`datetime`,`success`,`activity`,`target_table`)
VALUES (NULL,@email,@now,'0','INSERT','payment');
END $$

CREATE TRIGGER log_payment_afterinsert AFTER INSERT ON payment FOR EACH ROW
BEGIN
UPDATE log
SET success = 1
WHERE activity = 'INSERT' AND target_table = 'payment' AND email = @email AND datetime = @now;
END $$

CREATE TRIGGER log_payment_update BEFORE UPDATE ON payment FOR EACH ROW
BEGIN
SET @now = now();
INSERT INTO log(`log_id`,`email`,`datetime`,`success`,`activity`,`target_table`)
VALUES (NULL,@email,@now,'0','UPDATE','payment');
END $$

CREATE TRIGGER log_payment_afterupdate AFTER UPDATE ON payment FOR EACH ROW
BEGIN
UPDATE log
SET success = 1
WHERE activity = 'UPDATE' AND target_table = 'payment' AND email = @email AND datetime = @now;
END $$

CREATE TRIGGER log_payment_delete BEFORE DELETE ON payment FOR EACH ROW
BEGIN
SET @now = now();
INSERT INTO log(`log_id`,`email`,`datetime`,`success`,`activity`,`target_table`)
VALUES (NULL,@email,@now,'0','DELETE','payment');
END $$

CREATE TRIGGER log_payment_afterdelete AFTER DELETE ON payment FOR EACH ROW
BEGIN
UPDATE log
SET success = 1
WHERE activity = 'DELETE' AND target_table = 'payment' AND email = @email AND datetime = @now;
END $$

DELIMITER ;