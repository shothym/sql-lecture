USE shop;
-- Insert initlal data
START TRANSACTION;

INSERT INTO item(name, price, category) VALUES('CD',       1500, 'Music');
INSERT INTO item(name, price, category) VALUES('Record',   2000, 'Music');
INSERT INTO item(name, price, category) VALUES('Novel',    800,  'Book');
INSERT INTO item(name, price, category) VALUES('Magazine', 500,  'Book');
INSERT INTO item(name, price, category) VALUES('DVD',      4000, 'Movie');

INSERT INTO stock(name, item_id, quantity) VALUES('Music store', 1,   1000);
INSERT INTO stock(name, item_id, quantity) VALUES('Music store', 2,   200);
INSERT INTO stock(name, item_id, quantity) VALUES('Music store', 4,   100);
INSERT INTO stock(name, item_id, quantity) VALUES('Book store',  3,   1000);
INSERT INTO stock(name, item_id, quantity) VALUES('Book store',  4,   500);
INSERT INTO stock(name, item_id, quantity) VALUES('Book store',  100, 500);

COMMIT;
