class House

  attr_reader :id
  attr_accessor :name, :logo_url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo_url = options['logo_url']
  end

  def save()
    sql = "INSERT INTO houses (name, logo_url)
      VALUES ($1, $2)
      RETURNING id"
    values = [@name, @logo_url]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def self.find_all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    results = houses.map{|house| House.new(house)}
    return results
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values).first
    result = House.new(house)
    return result
  end



end
