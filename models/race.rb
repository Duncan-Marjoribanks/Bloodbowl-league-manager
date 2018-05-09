require_relative("../db/sql_runner")


class Race

  attr_reader :id, :name, :bio

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @bio = options['bio']
  end

  def save()
    sql = 'INSERT INTO races
    (id, name, bio)
    VALUES
    ($1, $2, $3)'
    values = [@id, @name, @bio]
    results = SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM races'
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM races'
    races_hash = SqlRunner.run(sql)
    result = races_hash.map{|race| Race.new(race)}
    return result
  end

end
