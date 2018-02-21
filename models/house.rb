require_relative('../db/sql_runner.rb')

class House

  attr_reader :id, :name, :logo_url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo_url = options['logo_url']
  end

  def save()
    sql = "INSERT INTO houses
      (
        name,
        logo_url
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id;"
    result = SqlRunner.run(sql, [@name, @logo_url])
    @id = result[0]['id'].to_i
  end

  def House.all()
    sql = "SELECT * FROM houses;"
    result = SqlRunner.run(sql)
    return result.map{|house| House.new(house)}
  end

  def House.delete_all()
    sql = "DELETE FROM houses;"
    SqlRunner.run(sql)
  end

  def House.find(house_id)
    sql = "SELECT * FROM houses WHERE id = $1;"
    result = SqlRunner.run(sql, [house_id])
    return House.new(result[0])
  end

end
