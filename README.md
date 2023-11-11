# TVonDemand-Database
Created a database for a TVonDemand application/company with procedures and triggers for data manipulation.

Procedures:

Procedure getBestSelling: Get the best selling film or series between a desired date space.
Procedure getRentalsInDay: Return the number of rentals a user has completed in a certain date.
Procedure giveMonthPayment: Return a list with all the sum of all payments categorized in their corresponding month and year.
Procedure getActorBetween: Returns all the actors that fall in a desired character space like 'Ala'-'Alu' and counts how many they are.
Procedure getActorFirstlastName: Returns all the actors that have the same desired last name and counts them.

Triggers:

Trigger 1: This trigger is handling the completion of rentals for a user in the "log" table. It tracks the date of the rental and states which action occured. 
           If a new rental happened, it says "Insert", if a rental was deleted "Delete" and if updated "Update".
Trigger 2: This trigger calculates a discount for a user who has completed 3*n rentals in a day. For example the payment amount of the 3rd rental will be 
           the 50% of the last two rentals. Also, the payment objects are inserted automatically to the payment table by the trigger.
Trigger 3: This trigger prevents the user from changing his customer_id, addres_id, active and create_date, while he/she can change any other profile data he/she wants.
