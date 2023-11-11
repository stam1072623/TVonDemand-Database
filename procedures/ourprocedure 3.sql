USE tvondemand;
DROP PROCEDURE IF EXISTS giveMonthPayment;
CREATE PROCEDURE giveMonthPayment()
BEGIN
SELECT MONTH(payment_date),YEAR(payment_date),
IFNULL(SUM(CASE WHEN rental.episodes IS NULL THEN payment.amount END),0) AS movies_pay,
IFNULL(SUM(CASE WHEN rental.episodes IS NOT NULL THEN payment.amount END),0) AS series_pay
FROM payment
INNER JOIN rental ON payment.rental_id = rental.rental_id
GROUP BY DATE_FORMAT(payment.payment_date,'%Y%m')
ORDER BY payment.payment_date;

END$$
DELIMITER ;
