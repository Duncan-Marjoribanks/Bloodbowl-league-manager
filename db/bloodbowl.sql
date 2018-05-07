DROP TABLE games;
DROP TABLE teams;

CREATE TABLE teams (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE games (
  id SERIAL4 PRIMARY KEY,
  team_a INT4 REFERENCES teams(id) ON DELETE CASCADE,
  team_b INT4 REFERENCES teams(id) ON DELETE CASCADE,
  winner INT4 REFERENCES teams(id) ON DELETE CASCADE
);
