require_relative("../db/sql_runner")

class Team

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO teams
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


  # class functions below this comment

  def self.all()
    sql = 'SELECT * from teams'
    teams_hash = SqlRunner.run(sql)
    result = teams_hash.map{|team| Team.new(team)}
    return result
  end


  def self.delete_all()
    sql = 'DELETE FROM teams'
    SqlRunner.run(sql)
  end


end
