CREATE DATABASE movies_recommendation;
USE movies_recommendation;
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100),
    email VARCHAR(100),
    age INT,
    country VARCHAR(100)
);
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    release_year INT
);
CREATE TABLE genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(100)
);
CREATE TABLE movie_genres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);
CREATE TABLE ratings (
    user_id INT,
    movie_id INT,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 5),
    rating_date DATE,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);
CREATE TABLE watchlist (
    user_id INT,
    movie_id INT,
    date_added DATE,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);
INSERT INTO users (user_name, email, age, country)
VALUES
('User1', 'user1@example.com', 25, 'USA'),
('User2', 'user2@example.com', 30, 'Canada'),
('User3', 'user3@example.com', 28, 'UK'),
('User4', 'user4@example.com', 22, 'India'),
('User5', 'user5@example.com', 35, 'Germany'),
('User6', 'user6@example.com', 25, 'USA'),
('User7', 'user7@example.com', 30, 'Canada'),
('User8', 'user8@example.com', 28, 'UK'),
('User9', 'user9@example.com', 22, 'India'),
('User10', 'user10@example.com', 35, 'Germany'),
('User11', 'user11@example.com', 25, 'USA'),
('User12', 'user12@example.com', 30, 'Canada'),
('User13', 'user13@example.com', 28, 'UK'),
('User14', 'user14@example.com', 22, 'India'),
('User15', 'user15@example.com', 35, 'Germany'),
('User16', 'user16@example.com', 25, 'USA'),
('User17', 'user17@example.com', 30, 'Canada'),
('User18', 'user18@example.com', 28, 'UK'),
('User19', 'user19@example.com', 22, 'India'),
('User20', 'user20@example.com', 35, 'Germany'),
('User21', 'user21@example.com', 25, 'USA'),
('User22', 'user22@example.com', 30, 'Canada'),
('User23', 'user23@example.com', 28, 'UK'),
('User24', 'user24@example.com', 22, 'India'),
('User25', 'user25@example.com', 35, 'Germany');
INSERT INTO movies (title, release_year)
VALUES
('The Forgotten Kingdom', 1995),
('Shadows of Tomorrow', 2000),
('Rising Sun', 2001),
('Echoes of Eternity', 1997),
('The Silent Watcher', 2005),
('Beyond the Horizon', 2010),
('Winds of Change', 2012),
('The Last Frontier', 2015),
('City of Dreams', 2016),
('Fading Memories', 2017),
('A New Dawn', 2020),
('Parallel Worlds', 2021),
('Whispers of the Past', 1999),
('Infinite Journey', 2018),
('Into the Abyss', 2022),
('Broken Wings', 2013),
('The Final Stand', 1998),
('Mystic Shadows', 2019),
('Forgotten Heroes', 2023),
('The Golden Compass', 2003),
('Crimson Tide', 2006),
('Legends Never Die', 2014),
('Wanderers of Time', 2009),
('Chasing the Horizon', 2007),
('Falling Skies', 2011),
('Kingdom of Ash', 1996),
('The Last Guardian', 2024),
('Beneath the Surface', 2015),
('Journey to Oblivion', 2004),
('The Hidden Truth', 2008),
('Lost at Sea', 2017),
('The Phantom War', 2002),
('Tales of the Unknown', 2010),
('Broken Promises', 2011),
('Legacy of Fire', 2018),
('The Silent Storm', 2022),
('Shattered Reality', 2009),
('Moonlight Serenade', 2014),
('The Crimson Rose', 2001),
('Wings of Destiny', 2016),
('Secrets of the Deep', 2023),
('Frozen Empire', 1997),
('Rise of the Fallen', 1998),
('Guardians of Light', 2000),
('The Final Hour', 2021),
('Veil of Shadows', 2024),
('Echoes in the Wind', 2003),
('The Endless Journey', 2002),
('The Last Outpost', 2020),
('Fury of the Storm', 1999),
('Voices of the Lost', 2019),
('Dreamcatcher', 2006);
INSERT INTO genres (genre_name)
VALUES
('Action'),
('Drama'),
('Sci-Fi'),
('Romance'),
('Comedy'),
('Thriller'),
('Fantasy'),
('Documentary'),
('Horror'),
('Animation');
INSERT INTO movie_genres (movie_id, genre_id)
VALUES
((SELECT movie_id FROM movies WHERE title = 'The Forgotten Kingdom'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Shadows of Tomorrow'), (SELECT genre_id FROM genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM movies WHERE title = 'Rising Sun'), (SELECT genre_id FROM genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movies WHERE title = 'Echoes of Eternity'), (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM movies WHERE title = 'The Silent Watcher'), (SELECT genre_id FROM genres WHERE genre_name = 'Thriller')),
((SELECT movie_id FROM movies WHERE title = 'Beyond the Horizon'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Winds of Change'), (SELECT genre_id FROM genres WHERE genre_name = 'Romance')),
((SELECT movie_id FROM movies WHERE title = 'The Last Frontier'), (SELECT genre_id FROM genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movies WHERE title = 'City of Dreams'), (SELECT genre_id FROM genres WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM movies WHERE title = 'Fading Memories'), (SELECT genre_id FROM genres WHERE genre_name = 'Documentary')),
((SELECT movie_id FROM movies WHERE title = 'A New Dawn'), (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM movies WHERE title = 'Parallel Worlds'), (SELECT genre_id FROM genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM movies WHERE title = 'Whispers of the Past'), (SELECT genre_id FROM genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movies WHERE title = 'Infinite Journey'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Into the Abyss'), (SELECT genre_id FROM genres WHERE genre_name = 'Horror')),
((SELECT movie_id FROM movies WHERE title = 'Broken Wings'), (SELECT genre_id FROM genres WHERE genre_name = 'Romance')),
((SELECT movie_id FROM movies WHERE title = 'The Final Stand'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Mystic Shadows'), (SELECT genre_id FROM genres WHERE genre_name = 'Thriller')),
((SELECT movie_id FROM movies WHERE title = 'Forgotten Heroes'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'The Golden Compass'), (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM movies WHERE title = 'Crimson Tide'), (SELECT genre_id FROM genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movies WHERE title = 'Legends Never Die'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Wanderers of Time'), (SELECT genre_id FROM genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM movies WHERE title = 'Chasing the Horizon'), (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM movies WHERE title = 'Falling Skies'), (SELECT genre_id FROM genres WHERE genre_name = 'Thriller')),
((SELECT movie_id FROM movies WHERE title = 'Kingdom of Ash'), (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM movies WHERE title = 'The Last Guardian'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Beneath the Surface'), (SELECT genre_id FROM genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movies WHERE title = 'Journey to Oblivion'), (SELECT genre_id FROM genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM movies WHERE title = 'The Hidden Truth'), (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM movies WHERE title = 'Lost at Sea'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'The Phantom War'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Tales of the Unknown'), (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM movies WHERE title = 'Broken Promises'), (SELECT genre_id FROM genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movies WHERE title = 'Legacy of Fire'), (SELECT genre_id FROM genres WHERE genre_name = 'Thriller')),
((SELECT movie_id FROM movies WHERE title = 'The Silent Storm'), (SELECT genre_id FROM genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movies WHERE title = 'Shattered Reality'), (SELECT genre_id FROM genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM movies WHERE title = 'Moonlight Serenade'), (SELECT genre_id FROM genres WHERE genre_name = 'Romance')),
((SELECT movie_id FROM movies WHERE title = 'The Crimson Rose'), (SELECT genre_id FROM genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movies WHERE title = 'Wings of Destiny'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Secrets of the Deep'), (SELECT genre_id FROM genres WHERE genre_name = 'Documentary')),
((SELECT movie_id FROM movies WHERE title = 'Frozen Empire'), (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM movies WHERE title = 'Rise of the Fallen'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Guardians of Light'), (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM movies WHERE title = 'The Final Hour'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Veil of Shadows'), (SELECT genre_id FROM genres WHERE genre_name = 'Thriller')),
((SELECT movie_id FROM movies WHERE title = 'Echoes in the Wind'), (SELECT genre_id FROM genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movies WHERE title = 'The Endless Journey'), (SELECT genre_id FROM genres WHERE genre_name = 'Horror')),
((SELECT movie_id FROM movies WHERE title = 'The Last Outpost'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Fury of the Storm'), (SELECT genre_id FROM genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM movies WHERE title = 'Voices of the Lost'), (SELECT genre_id FROM genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movies WHERE title = 'Dreamcatcher'), (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy'));

INSERT INTO ratings (user_id, movie_id, rating, rating_date)
VALUES
((SELECT user_id FROM users WHERE user_name = 'User1'), (SELECT movie_id FROM movies WHERE title = 'The Forgotten Kingdom'), 4.5, '2024-01-01'),
((SELECT user_id FROM users WHERE user_name = 'User2'), (SELECT movie_id FROM movies WHERE title = 'Shadows of Tomorrow'), 3.0, '2024-01-02'),
((SELECT user_id FROM users WHERE user_name = 'User3'), (SELECT movie_id FROM movies WHERE title = 'Rising Sun'), 4.0, '2024-01-03'),
((SELECT user_id FROM users WHERE user_name = 'User4'), (SELECT movie_id FROM movies WHERE title = 'Echoes of Eternity'), 5.0, '2024-01-04'),
((SELECT user_id FROM users WHERE user_name = 'User5'), (SELECT movie_id FROM movies WHERE title = 'The Silent Watcher'), 4.8, '2024-01-05'),
((SELECT user_id FROM users WHERE user_name = 'User6'), (SELECT movie_id FROM movies WHERE title = 'Beyond the Horizon'), 3.5, '2024-01-06'),
((SELECT user_id FROM users WHERE user_name = 'User7'), (SELECT movie_id FROM movies WHERE title = 'Winds of Change'), 2.0, '2024-01-07'),
((SELECT user_id FROM users WHERE user_name = 'User8'), (SELECT movie_id FROM movies WHERE title = 'The Last Frontier'), 3.7, '2024-01-08'),
((SELECT user_id FROM users WHERE user_name = 'User9'), (SELECT movie_id FROM movies WHERE title = 'City of Dreams'), 4.2, '2024-01-09'),
((SELECT user_id FROM users WHERE user_name = 'User10'), (SELECT movie_id FROM movies WHERE title = 'Fading Memories'), 3.1, '2024-01-10'),
((SELECT user_id FROM users WHERE user_name = 'User11'), (SELECT movie_id FROM movies WHERE title = 'A New Dawn'), 4.6, '2024-01-11'),
((SELECT user_id FROM users WHERE user_name = 'User12'), (SELECT movie_id FROM movies WHERE title = 'Parallel Worlds'), 5.0, '2024-01-12'),
((SELECT user_id FROM users WHERE user_name = 'User13'), (SELECT movie_id FROM movies WHERE title = 'Whispers of the Past'), 2.5, '2024-01-13'),
((SELECT user_id FROM users WHERE user_name = 'User14'), (SELECT movie_id FROM movies WHERE title = 'Infinite Journey'), 3.8, '2024-01-14'),
((SELECT user_id FROM users WHERE user_name = 'User15'), (SELECT movie_id FROM movies WHERE title = 'Into the Abyss'), 4.0, '2024-01-15'),
((SELECT user_id FROM users WHERE user_name = 'User16'), (SELECT movie_id FROM movies WHERE title = 'Broken Wings'), 3.6, '2024-01-16'),
((SELECT user_id FROM users WHERE user_name = 'User17'), (SELECT movie_id FROM movies WHERE title = 'The Final Stand'), 2.2, '2024-01-17'),
((SELECT user_id FROM users WHERE user_name = 'User18'), (SELECT movie_id FROM movies WHERE title = 'Mystic Shadows'), 4.4, '2024-01-18'),
((SELECT user_id FROM users WHERE user_name = 'User19'), (SELECT movie_id FROM movies WHERE title = 'Forgotten Heroes'), 5.0, '2024-01-19'),
((SELECT user_id FROM users WHERE user_name = 'User20'), (SELECT movie_id FROM movies WHERE title = 'The Golden Compass'), 3.0, '2024-01-20'),
((SELECT user_id FROM users WHERE user_name = 'User21'), (SELECT movie_id FROM movies WHERE title = 'Crimson Tide'), 4.3, '2024-01-21'),
((SELECT user_id FROM users WHERE user_name = 'User22'), (SELECT movie_id FROM movies WHERE title = 'Legends Never Die'), 2.8, '2024-01-22'),
((SELECT user_id FROM users WHERE user_name = 'User23'), (SELECT movie_id FROM movies WHERE title = 'Wanderers of Time'), 4.1, '2024-01-23'),
((SELECT user_id FROM users WHERE user_name = 'User24'), (SELECT movie_id FROM movies WHERE title = 'Chasing the Horizon'), 3.4, '2024-01-24'),
((SELECT user_id FROM users WHERE user_name = 'User25'), (SELECT movie_id FROM movies WHERE title = 'Falling Skies'), 5.0, '2024-01-25');

-- TO FIND THE MOVIES RATED BY AN USER
SELECT mov.title, r.rating, r.rating_date
FROM ratings r
JOIN movies mov ON r.movie_id = mov.movie_id
WHERE r.user_id = (SELECT user_id FROM users WHERE user_name = 'User5');

-- TO FIND TOP 10 MOVIES BASED ON AVERAGE RATING
SELECT mov.title, AVG(r.rating)
FROM ratings r
JOIN movies mov ON r.movie_id = mov.movie_id
GROUP BY mov.title
ORDER BY AVG(r.rating) DESC
LIMIT 10;


-- TO RECOMMEND MOVIES BASED ON GENRE
SELECT mov.title
FROM movies mov
JOIN movie_genres mg ON mov.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
WHERE g.genre_name = 'Sci-Fi'
  AND mov.movie_id NOT IN (
    SELECT r.movie_id FROM ratings r WHERE r.user_id = (SELECT user_id FROM users WHERE user_name = 'User15')
  );


-- TO FIND SIMILAR USERS BASED ON RATINGS
SELECT u2.user_name, COUNT(*) AS common_ratings
FROM ratings r1
JOIN ratings r2 ON r1.movie_id = r2.movie_id
JOIN users u1 ON r1.user_id = u1.user_id
JOIN users u2 ON r2.user_id = u2.user_id
WHERE u1.user_name = 'User7' AND u2.user_name != 'User7'
  AND ABS(r1.rating - r2.rating) <= 1 -- Users who rated within 1 point difference
GROUP BY u2.user_name
ORDER BY common_ratings DESC;

-- Recommend Movies Based on Watchlist
SELECT DISTINCT m.title
FROM movies m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN movie_genres mwg ON mwg.genre_id = mg.genre_id
JOIN watchlist w ON w.movie_id = mwg.movie_id
WHERE w.user_id = (SELECT user_id FROM users WHERE name = 'User9')
  AND m.movie_id NOT IN (
    SELECT movie_id FROM watchlist WHERE user_id = (SELECT user_id FROM users WHERE name = 'User9')
  );


-- Find Trending Movies Based on Watchlist Additions
SELECT m.title, COUNT(w.movie_id)
FROM watchlist w
JOIN movies m ON w.movie_id = m.movie_id
WHERE w.date_added > CURDATE() - INTERVAL 30 DAY
GROUP BY m.title
ORDER BY COUNT(w.movie_id) DESC;
