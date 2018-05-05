require_relative('../db/sql_runner')
class Game

  attr_reader :team_a, :team_b, :winner

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @team_a = options['team_a']
    @team_b = options['team_b']
    @winner = options['winner']
  end



end
