require('minitest/autorun')
require('minitest/rg')
require_relative('../student')

class  TestStudent < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'first_name' => 'Harry',
      'last_name' => 'Potter',
      'age' => 14,
      'house' => 'Gryffindor'
    }
    @student = Student.new(options)
  end

  def test_student_has_first_name
    assert_equal('Harry', @student.first_name)
  end

end
