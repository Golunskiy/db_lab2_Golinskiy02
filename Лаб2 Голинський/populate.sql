-- ------------------------
-- Populate Place table
-- ------------------------
INSERT INTO Place(place_id, place_city, place_country)
VALUES('0', 'Beijing', 'China');
INSERT INTO Place(place_id, place_city, place_country)
VALUES('1', 'Hawthorne', 'United States');
INSERT INTO Place(place_id, place_city, place_country)
VALUES('2', 'Surry Hills', 'Australia');
INSERT INTO Place(place_id, place_city, place_country)
VALUES('3', 'London', 'United Kingdom');
INSERT INTO Place(place_id, place_city, place_country)
VALUES('4', 'San Francisco', 'United States');

-- ----------------------
-- Populate Industry table
-- ----------------------
INSERT INTO Industry(ind_id, ind_1, ind_2, ind_3)
VALUES('0', 'Artificial intelligence', NULL, NULL);
INSERT INTO Industry(ind_id, ind_1, ind_2, ind_3)
VALUES('1', 'Other', NULL, NULL);
INSERT INTO Industry(ind_id, ind_1, ind_2, ind_3)
VALUES('2', 'Internet software', 'Services', NULL);
INSERT INTO Industry(ind_id, ind_1, ind_2, ind_3)
VALUES('3', 'Fintech', NULL, NULL);
INSERT INTO Industry(ind_id, ind_1, ind_2, ind_3)
VALUES('4', 'Supply chain', 'Logistics', 'Delivery');


-- -----------------------
-- Populate Company table
-- -----------------------
INSERT INTO Company(com_id, com_name, com_valuation, com_joined, place_id, ind_id)
VALUES('0', 'ByteDance', '$140', '7/4/2013', '0', '0');
INSERT INTO Company(com_id, com_name, com_valuation, com_joined, place_id, ind_id)
VALUES('1', 'SpaceX', '$127', '1/12/2012', '1', '1');
INSERT INTO Company(com_id, com_name, com_valuation, com_joined, place_id, ind_id)
VALUES('2', 'Canva', '$40', '8/1/2015', '2', '2');
INSERT INTO Company(com_id, com_name, com_valuation, com_joined, place_id, ind_id)
VALUES('3', 'Checkout.com', '$40', '2/5/2014', '3', '3');
INSERT INTO Company(com_id, com_name, com_valuation, com_joined, place_id, ind_id)
VALUES('4', 'Instacart', '$39', '30/12/2013', '4', '4');


