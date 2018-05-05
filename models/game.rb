require_relative('../db/sql_runner')
class Game

  attr_reader :team_a, :team_b, :winner

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

end
