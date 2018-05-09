require_relative("../db/sql_runner")

class Team

  attr_reader :id
  attr_accessor :name, :race

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @race =options['race'].to_i
  end

  def save()
    sql = 'INSERT INTO teams
    (name, race)
    VALUES
    ($1, $2)
    RETURNING id'
    values = [@name, @race]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = 'UPDATE teams
    SET name = $1
    WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def played_games(place)
    sql = "SELECT * FROM games WHERE games.#{place} = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    results_array = results.map{|result| Game.new(result)}
    return results_array
  end

  def played_away()
    return played_games("away")
  end

  def played_at_home()
    return played_games("home")
  end

  def self.all()
    sql = 'SELECT * from teams'
    teams_hash = SqlRunner.run(sql)
    result = teams_hash.map{|team| Team.new(team)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM teams
    WHERE id = $1"
    values = [id]
    teams_hash = SqlRunner.run(sql, values)
    return Team.new(teams_hash.first)
  end

  def delete()
    sql = "DELETE FROM teams
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM teams'
    SqlRunner.run(sql)
  end

  def race_bio()
    sql = 'SELECT races.bio FROM races WHERE races.id = $1'
    values =[@race]
    race = SqlRunner.run(sql,values)
    return race.first
  end

end
