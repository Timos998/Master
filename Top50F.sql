pi@raspberrypi:~ $ psql test
psql (11.12 (Raspbian 11.12-0+deb10u1))
Type "help" for help.

test=> SELECT * FROM movies1 where url='the-dark-knight-rises';
test=> 
test=> SELECT url FROM movies1
test-> WHERE lexemesSummary @@ to_tsquery('batman');
                url                
-----------------------------------
 batman
 the-dark-knight-rises
 batman-begins
 batman-forever
 batman-returns
 batman-robin
 the-dark-knight
 the-lego-batman-movie
 out-of-sight
 the-postman
 scary-movie-3
 street-fight
 superhero-movie
 man-of-steel
 batman-v-superman-dawn-of-justice
 the-trip-to-italy
(16 rows)

test=> UPDATE movies1
test-> SET rank = ts_rank(lexemesSummary,plainto_tsquery(
test(> (
test(> SELECT Summary FROM movies1 WHERE url='the-dark-knight-rises')));
UPDATE 5229
test=> CREATE TABLE RBOSFieldDARKKNIGHTRISES AS
test-> SELECT url, rank FROM movies1 WHERE rank > 0.95 ORDER BY rank DESC LIMIT 50;
SELECT 1
ALTER TABLE RBOSFieldDARKKNIGHTRISES AS
                                             ^
test=> CREATE TABLE RBOSFIELDtdkr AS
test-> SELECT url, rank FROM movies1 WHERE rank > 0.25 ORDER BY rank DESC LIMIT 50;
SELECT 50
test=> \copy (SELECT * FROM RBOSFIELDtdkr) to '/home/pi/RSL/top50recommendationsTDKR.csv' WITH csv;
COPY 50


