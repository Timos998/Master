test=> ALTER TABLE movies1
test-> ADD lexemestitle tsvector;
ALTER TABLE
test=> UPDATE movies1
test-> SET lexemestitle = to_tsvector(title);
UPDATE 5229
test=> SELECT url FROM movies1
test-> WHERE lexemestitle @@ to_tsquery('batman');
                url                
-----------------------------------
 batman
 batman-begins
 batman-forever
 batman-returns
 batman-robin
 the-lego-batman-movie
 batman-v-superman-dawn-of-justice
(7 rows)

test=> UPDATE movies1
test-> SET rank = ts_rank(lexemestitle,plainto_tsquery(
test(> (
test(> SELECT title FROM movies1 WHERE url='the-dark-knight-rises')));
UPDATE 5229
test=> CREATE TABLE RBOSFtitle AS
test-> SELECT url, rank FROM movies1 WHERE rank > 0.25 ORDER BY rank DESC LIMIT 50;
SELECT 1
test=> CREATE TABLE RBOStitle2 AS
test-> SELECT url, rank FROM movies1 WHERE rank > 0.10 ORDER BY rank DESC LIMIT 50;
SELECT 1
