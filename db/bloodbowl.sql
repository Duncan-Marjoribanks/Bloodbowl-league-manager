DROP TABLE game;
DROP TABLE team;

CREATE TABLE teams (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE games (
  id SERIAL4 PRIMARY KEY,
  team_a INT4 REFERENCES team(id),
  team_b INT4 REFERENCES team(id),
  winner VARCHAR(255)
);
