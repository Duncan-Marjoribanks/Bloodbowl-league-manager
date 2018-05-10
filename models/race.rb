require_relative("../db/sql_runner")


class Race

  attr_reader :id, :name, :bio, :logo

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @bio = options['bio']
    @logo = options['logo']
  end

  def save()
    sql = 'INSERT INTO races
    (id, name, bio, logo)
    VALUES
    ($1, $2, $3, $4)'
    values = [@id, @name, @bio, @logo]
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
