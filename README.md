# Bloodbowl-league-manager
A personal project for week 5 Code Clan.

This web app was a personal project to shore up learning using Ruby, PostgreSQL, SQL and Sinatra.
It is a Bloodbowl game tracker app which allows the user to input a series of teams into a local database
and to keep track of which teams have played against each other. It also records the scores.

The app requires a local database be set up named "bloodbowl" with the "db/bloodbowl.sql" file as the source.

Before running the app in ruby for the first time, please run the db/seeds.rb file in ruby to seed the data.

The app may then be run using the app.rb in Ruby.

It runs using Sinatra and will be accessible as a localhost/4567 in your browser.


# Brief

Sports Scoring app
Build an app that let's a sportsfan keep track of their favourite sports league.

MVP:
The app should allow the user create, edit and delete teams to the league
The user should be able to create, edit and delete games
There should be a way to display all the games for a team and all the teams involved in a game
The app should display if a game was won or lost
Inspired by
Sky Sports, BBC Sports

Possible Extensions:
Create a league table to see who is on top of the league
You might not want/need to create a table in the database for this, but just use Ruby logic in the models to calculate each teams points etc, based on the results of games
Add players to teams and let them have game stats (points won, fouls, etc.)
Anything else you can think of
