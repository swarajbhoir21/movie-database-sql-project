-- ==============================
-- MOVIE DATABASE (INITIAL VERSION)
-- ==============================

-- Drop table if already exists
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE movies';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

-- Create basic movies table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(150),
    release_year INT,
    genre VARCHAR(50),
    duration INT,            -- runtime in minutes
    budget BIGINT,
    revenue BIGINT,
    rating DECIMAL(3,1),     -- IMDb user rating
    metascore INT,           -- critic score
    votes BIGINT,
    director VARCHAR(100),
    imdb_url VARCHAR(200),   -- external reference link
    industry VARCHAR(20)     -- Bollywood / Hollywood
);

-- Insert sample movies

-- Hollywood
INSERT INTO movies VALUES (1, 'Inception', 2010, 'Sci-Fi/Thriller', 148, 160000000, 829000000, 8.8, 74, 2300000, 'Christopher Nolan', 'https://www.imdb.com/title/tt1375666/', 'Hollywood');
INSERT INTO movies VALUES (2, 'The Dark Knight', 2008, 'Action/Crime', 152, 185000000, 1005000000, 9.0, 84, 2700000, 'Christopher Nolan', 'https://www.imdb.com/title/tt0468569/', 'Hollywood');
INSERT INTO movies VALUES (3, 'Interstellar', 2014, 'Sci-Fi/Adventure', 169, 165000000, 701000000, 8.6, 74, 1900000, 'Christopher Nolan', 'https://www.imdb.com/title/tt0816692/', 'Hollywood');
INSERT INTO movies VALUES (4, 'Avatar', 2009, 'Sci-Fi/Fantasy', 162, 237000000, 2923706026, 7.9, 83, 1400000, 'James Cameron', 'https://www.imdb.com/title/tt0499549/', 'Hollywood');
INSERT INTO movies VALUES (5, 'Avengers: Endgame', 2019, 'Action/Sci-Fi', 181, 356000000, 2797800564, 8.4, 78, 1200000, 'Anthony Russo, Joe Russo', 'https://www.imdb.com/title/tt4154796/', 'Hollywood');

-- Bollywood
INSERT INTO movies VALUES (6, '3 Idiots', 2009, 'Comedy/Drama', 170, 550000000, 4600000000, 8.4, 67, 400000, 'Rajkumar Hirani', 'https://www.imdb.com/title/tt1187043/', 'Bollywood');
INSERT INTO movies VALUES (7, 'Gully Boy', 2019, 'Drama/Music', 154, 400000000, 2380000000, 7.9, 65, 85000, 'Zoya Akhtar', 'https://www.imdb.com/title/tt2395469/', 'Bollywood');
INSERT INTO movies VALUES (8, 'Dangal', 2016, 'Biography/Sports', 161, 700000000, 20240000000, 8.4, 74, 200000, 'Nitesh Tiwari', 'https://www.imdb.com/title/tt5074352/', 'Bollywood');
INSERT INTO movies VALUES (9, 'Sholay', 1975, 'Action/Adventure', 204, 3000000, 350000000, 8.2, 65, 55000, 'Ramesh Sippy', 'https://www.imdb.com/title/tt0073707/', 'Bollywood');
INSERT INTO movies VALUES (10, 'Pathaan', 2023, 'Action/Thriller', 146, 2500000000, 10500000000, 6.8, 52, 120000, 'Siddharth Anand', 'https://www.imdb.com/title/tt12844910/', 'Bollywood');

COMMIT;


-- ==============================
-- MOVIE DATABASE (UPDATED VERSION)
-- ==============================

-- Drop table if already exists
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE movies';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

-- Create enhanced movies table with constraints
CREATE TABLE movies (
    movie_id     NUMBER PRIMARY KEY,
    title        VARCHAR2(150) NOT NULL,
    release_year NUMBER(4) CHECK (release_year >= 1900),
    genre        VARCHAR2(50),
    duration     NUMBER CHECK (duration > 0),  
    budget       NUMBER(15) CHECK (budget >= 0),
    revenue      NUMBER(15) CHECK (revenue >= 0),
    rating       NUMBER(3,1) CHECK (rating BETWEEN 0 AND 10),  
    metascore    NUMBER CHECK (metascore BETWEEN 0 AND 100),
    votes        NUMBER(15) CHECK (votes >= 0),
    director     VARCHAR2(100),
    imdb_url     VARCHAR2(200),
    industry     VARCHAR2(20) CHECK (industry IN ('Bollywood', 'Hollywood'))
);

-- Add documentation comments
COMMENT ON TABLE movies IS 'Movie dataset for analytics project (Bollywood & Hollywood)';
COMMENT ON COLUMN movies.title IS 'Movie title';
COMMENT ON COLUMN movies.release_year IS 'Year of release';
COMMENT ON COLUMN movies.rating IS 'IMDb user rating out of 10';
COMMENT ON COLUMN movies.industry IS 'Film industry: Bollywood or Hollywood';

-- Insert sample movies (same dataset for fair comparison)

-- Hollywood
INSERT INTO movies VALUES (1, 'Inception', 2010, 'Sci-Fi/Thriller', 148, 160000000, 829000000, 8.8, 74, 2300000, 'Christopher Nolan', 'https://www.imdb.com/title/tt1375666/', 'Hollywood');
INSERT INTO movies VALUES (2, 'The Dark Knight', 2008, 'Action/Crime', 152, 185000000, 1005000000, 9.0, 84, 2700000, 'Christopher Nolan', 'https://www.imdb.com/title/tt0468569/', 'Hollywood');
INSERT INTO movies VALUES (3, 'Interstellar', 2014, 'Sci-Fi/Adventure', 169, 165000000, 701000000, 8.6, 74, 1900000, 'Christopher Nolan', 'https://www.imdb.com/title/tt0816692/', 'Hollywood');
INSERT INTO movies VALUES (4, 'Avatar', 2009, 'Sci-Fi/Fantasy', 162, 237000000, 2923706026, 7.9, 83, 1400000, 'James Cameron', 'https://www.imdb.com/title/tt0499549/', 'Hollywood');
INSERT INTO movies VALUES (5, 'Avengers: Endgame', 2019, 'Action/Sci-Fi', 181, 356000000, 2797800564, 8.4, 78, 1200000, 'Anthony Russo, Joe Russo', 'https://www.imdb.com/title/tt4154796/', 'Hollywood');

-- Bollywood
INSERT INTO movies VALUES (6, '3 Idiots', 2009, 'Comedy/Drama', 170, 550000000, 4600000000, 8.4, 67, 400000, 'Rajkumar Hirani', 'https://www.imdb.com/title/tt1187043/', 'Bollywood');
INSERT INTO movies VALUES (7, 'Gully Boy', 2019, 'Drama/Music', 154, 400000000, 2380000000, 7.9, 65, 85000, 'Zoya Akhtar', 'https://www.imdb.com/title/tt2395469/', 'Bollywood');
INSERT INTO movies VALUES (8, 'Dangal', 2016, 'Biography/Sports', 161, 700000000, 20240000000, 8.4, 74, 200000, 'Nitesh Tiwari', 'https://www.imdb.com/title/tt5074352/', 'Bollywood');
INSERT INTO movies VALUES (9, 'Sholay', 1975, 'Action/Adventure', 204, 3000000, 350000000, 8.2, 65, 55000, 'Ramesh Sippy', 'https://www.imdb.com/title/tt0073707/', 'Bollywood');
INSERT INTO movies VALUES (10, 'Pathaan', 2023, 'Action/Thriller', 146, 2500000000, 10500000000, 6.8, 52, 120000, 'Siddharth Anand', 'https://www.imdb.com/title/tt12844910/', 'Bollywood');

COMMIT;

