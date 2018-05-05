require_relative('../db/sql_runner')
class Game

  attr_reader :id, :team_a, :team_b, :winner

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @team_a = options['team_a']
    @team_b = options['team_b']
    @winner = options['winner']
  end

  def save()
    sql = "INSERT INTO games
    (team_a, team_b, winner)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@team_a, @team_b, @winner]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
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

  def self.delete_all()
    sql = 'DELETE FROM games'
    SqlRunner.run(sql)
  end


end
