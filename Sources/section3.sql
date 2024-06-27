-- class 32
CREATE TABLE users (
  id SERIAL,
  username VARCHAR(50) NOT NULL,
  CONSTRAINT pk_users PRIMARY KEY(id)
);

INSERT INTO users (username)
VALUES 
  ('monahan93'),
  ('pferrer'),
  ('si93onis'),
  ('99stroman');

SELECT * FROM users;

-- class 33
CREATE TABLE photos(
  id SERIAL,
  url VARCHAR(200) NOT NULL,
  user_id INTEGER NOT NULL,
  CONSTRAINT pk_photos PRIMARY KEY(id),
  CONSTRAINT fk_user_photos FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO photos(url, user_id) VALUES ('http://one.jpg', 4);

SELECT * FROM photos;

-- class 34
INSERT INTO photos(url, user_id) 
VALUES
  ('http://two.jpg', 1),
  ('http://three.jpg', 1),
  ('http://four.jpg', 4),
  ('http://five.jpg', 3),
  ('http://six.jpg', 2),
  ('http://seven.jpg', 2),
  ('http://eight.jpg', 4),
  ('http://nice.jpg', 3);

SELECT * FROM photos WHERE user_id = 4;

SELECT * FROM photos
JOIN users ON users.id = photos.user_id;

SELECT url, username FROM photos
JOIN users ON users.id = photos.user_id;

-- Exercise 1
-- Create table called 'boats'
CREATE TABLE boats (
    -- Note that this environment doesn't support 'SERIAL' keyword
    -- so 'AUTOINCREMENT' is used instead. Postgres always uses 'SERIAL'
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR
);

-- Insert two boats 
INSERT INTO boats (name)
VALUES ('Rogue Wave'), ('Harbor Master');

-- Create table called 'crew_members'
CREATE TABLE crew_members (
    -- Note that this environment doenst support 'SERIAL' keyword
    -- so 'AUTOINCREMENT' is used instead. Postgres always uses 'SERIAL'
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR,
	-- >>>>>>>> TODO #1 HERE!!!
    id_boat INTEGER REFERENCES boats(id)
);

-- Insert three crew members
INSERT INTO crew_members (first_name, boat_id)
VALUES ('Alex', 1), ('Lucia', 1), ('Ari', 2);

-- Write query here to fetch all columns for all crew_members associated with the boat that has an ID of 1
-- >>>>>>>> TODO #2 HERE!!!
SELECT * FROM crew_members WHERE boat_id = 1;

-- class 39
-- Save this code because it will be use in class 40
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id)
);
 
INSERT INTO photos (url, user_id)
VALUES
  ('http:/one.jpg', 4),
  ('http:/two.jpg', 1),
  ('http:/25.jpg', 1),
  ('http:/36.jpg', 1),
  ('http:/754.jpg', 2),
  ('http:/35.jpg', 3),
  ('http:/256.jpg', 4);

-- class 40
DROP TABLE photos;
SELECT * FROM photos;

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);
 
INSERT INTO photos (url, user_id)
VALUES
  ('http:/one.jpg', 4),
  ('http:/two.jpg', 1),
  ('http:/25.jpg', 1),
  ('http:/36.jpg', 1),
  ('http:/754.jpg', 2),
  ('http:/35.jpg', 3),
  ('http:/256.jpg', 4);
  
