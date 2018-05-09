require_relative('../db/sql_runner')
require_relative('./team')
require_relative('./race')

class Game

  attr_reader :id
  attr_accessor :home, :away, :home_score, :away_score

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @home = options['home']
    @home_score = options['home_score'].to_i
    @away = options['away']
    @away_score = options['away_score'].to_i
  end

  def save()
    sql = 'INSERT INTO games
    (home, home_score, away, away_score)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id'
    values = [@home, @home_score, @away, @away_score]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def update()
    sql = 'UPDATE games
    SET (home, home_score, away, away_score) = ($1, $2, $3, $4)
    WHERE id = $5'
    values = [@home, @home_score, @away, @away_score, @id]
    SqlRunner.run(sql, values)
  end

  def team(team_id, team_column)
    sql = "SELECT teams.name FROM teams
    INNER JOIN games ON teams.id = games.#{team_column}
    WHERE teams.id = $1"
    values = [team_id]
    team_hash = SqlRunner.run(sql, values)
    team = Team.new(team_hash.first)
    return team
  end

  def winner()
    if @away_score > @home_score
      winning_team_id = @away
    elsif @away_score < @home_score
      winning_team_id = @home
      return winning_team_id
    end
  end

  # class functions below this comment
  def self.all()
    sql = 'SELECT * from games'
    games_hash = SqlRunner.run(sql)
    result = games_hash.map{|game| Game.new(game)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM games
    WHERE id = $1"
    values = [id]
    games_hash = SqlRunner.run(sql, values)
    return Game.new(games_hash.first)
  end

  def self.delete(id)
    sql = "DELETE * FROM games
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM games'
    SqlRunner.run(sql)
  end



end
