require_relative('../db/sql_runner.rb')
require_relative('house.rb')

class Student

  attr_reader :id, :first_name, :last_name, :house_id, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students
      (
        first_name,
        last_name,
        house_id,
        age
      )
      VALUES
      (
        $1, $2, $3, $4
      )
      RETURNING id;"
    result = SqlRunner.run(sql, [@first_name, @last_name, @house_id, @age])
    @id = result[0]['id'].to_i
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = $1;"
    result = SqlRunner.run(sql, [@house_id])
    return House.new(result[0])
  end

  def Student.all()
    sql = "SELECT * FROM students;"
    result = SqlRunner.run(sql)
    return result.map{|student| Student.new(student)}
  end

  def Student.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def Student.find(student_id)
    sql = "SELECT * FROM students WHERE id = $1;"
    result = SqlRunner.run(sql, [student_id])
    return Student.new(result[0])
  end

end
