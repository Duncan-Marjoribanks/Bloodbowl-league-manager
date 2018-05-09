DROP TABLE games;
DROP TABLE teams;
DROP TABLE races;


CREATE TABLE races (
  id INT4 PRIMARY KEY,
  name VARCHAR(255),
  bio VARCHAR(255)
);

CREATE TABLE teams (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  race INT4 REFERENCES races(id) ON DELETE CASCADE
);

CREATE TABLE games (
  id SERIAL4 PRIMARY KEY,
  home INT4 REFERENCES teams(id) ON DELETE CASCADE,
  away INT4 REFERENCES teams(id) ON DELETE CASCADE,
  winner INT4 REFERENCES teams(id) ON DELETE CASCADE
);
