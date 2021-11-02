test=> ALTER TABLE movies1
test-> ADD lexemesStarring tsvector;
ALTER TABLE
                                         ^
test=> UPDATE movies1
test-> SET lexemesStarring = to_tsvector(Starring);
UPDATE 5229

test=> SELECT url FROM movies1
test-> WHERE lexemesStarring @@ to_tsquery('batman');
 url 
-----
(0 rows)

test=> UPDATE movies1
test-> SET rank = ts_rank(lexemesStarring,plainto_tsquery(
test(> (
test(> SELECT Starring FROM movies1 WHERE url='the-dark-knight-rises')));
UPDATE 5229
test=> CREATE TABLE RBOSFtdkrStarring AS
test-> SELECT url, rank FROM movies1 WHERE rank > 0.25 ORDER BY rank DESC LIMIT 50;
SELECT 24
                              ^
test=> \copy (SELECT*FROM RBOSFtdkrStarring) to '/home/pi/RSL/top50Starring.csv' WITH csv;
COPY 24
test=> 
