INSERT INTO `series` (`series_id`, `title`, `description`, `seasons`, `episodes`, `release_year`, `language_id`,`rating`) VALUES
(1,"Peaky Blinders"," Epic centred on a crime family of mixed Irish","6","36","2013","1","G"),
(2,"Supernatural","Sam and Dean have spent their lives on the road, battling supernatural threats ","15","327","2005","1","G"),
(3,"Breaking Bad","A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine","5","62","2008","3","G"),
(4,"Arrow","<p>After a violent shipwreck, billi","3","60","2012","4","G"),
(5,"Prison Break","The series revolves around two brothers, Lincoln Burrows (Dominic Purcell) and Michael Scofield (Wentworth Miller)","5","90","2005","4","G"),
(6,"The 100","<p>Ninety-seven years ago, nuclear ","10","80","2014","3","PG-13");

INSERT INTO `series_actor` (`actor_id`,`series_id`) VALUES
("2","1"),
("35","1"),
("16","1"),
("4","1"),
("9","2"),
("3","2"),
("20","2"),
("58","3"),
("40","3"),
("67","4"),
("100","4"),
("83","5"),
("69","5"),
("95","6");

INSERT INTO `series_category` (`series_id`,`category_id`) VALUES
("1","7"),
("1","1"),
("2","11"),
("3","1"),
("3","7"),
("4","8"),
("4","3"),
("5","4"),
("6","1"),
("6","7");

INSERT INTO `inventory` (`inventory_id`,`series_id`) VALUES
(NULL,"1"),
(NULL,"2"),
(NULL,"3"),
(NULL,"4"),
(NULL,"5"),
(NULL,"6");

INSERT INTO `address` (`address_id`,`address`,`district`,`city_id`,`postal_code`,`phone`) VALUES
(NULL,"1972 Hinkle Lake Road","Cambridge","511","02141","6176428510"),
(NULL,"1482 Leisure Lane","San Luis Obispo","439","93401","2139265814"),
(NULL,"1670 Blane Street","Saint Louis","477","63101","3144970496"),
(NULL,"2052 Copperhead Road","New Britain","88","06051","8605385284");

INSERT INTO `customer` (`customer_id`,`first_name`,`last_name`,`email`,`address_id`,`create_date`,`watch`) VALUES
(NULL,"THEON","DAWE","THEON.DAWE@sakilacustomer.org","602","2018-01-10 20:23:02","s"),
(NULL,"TASNIM","THOMPSON","TASNIM.THOMPSON@sakilacustomer.org","603","2020-10-17 23:57:56","s"),
(NULL,"ASA","CHRISTIE","ASA.CHRISTIE@sakilacustomer.org","604","2019-11-09 09:03:05","s"),
(NULL,"ARSLAN","KNIGHTS","ARSLAN.KNIGHTS@sakilacustomer.org","605","2016-05-02 11:57:55","s");

INSERT INTO `rental` (`rental_id`,`rental_date`,`inventory_id`,`customer_id`,`episodes`) VALUES
(NULL,"2018-02-10 20:23:02","4421","597","10"),
(NULL,"2020-11-17 23:57:56","4422","598","20"),
(NULL,"2019-12-09 09:03:05","4423","599","5"),
(NULL,"2016-06-02 11:57:55","4424","600","55");

INSERT INTO `payment` (`payment_id`, `customer_id`, `rental_id`, `amount`, `payment_date`) VALUES
(NULL,"597","16041","15.600000000000001","2018-02-10 20:23:02"),
(NULL,"598","16042","17.0","2020-11-17 23:57:56"),
(NULL,"599","16043","17.2","2019-12-09 09:03:05"),
(NULL,"600","16044","11.0","2016-06-02 11:57:55");

