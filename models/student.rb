require_relative("../db/sql_runner.rb")
require_relative("house")

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :house_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id']
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, age, house_id)
      VALUES ($1, $2, $3, $4)
      RETURNING id"
    values = [@first_name, @last_name, @age, @house_id]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def self.find_all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    results = students.map{|student| Student.new(student)}
    return results
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values).first
    result = Student.new(student)
    return result
  end

  def find_house
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house_id]
    house = SqlRunner.run(sql, values).first
    result = House.new(house)
    return result
  end

end
