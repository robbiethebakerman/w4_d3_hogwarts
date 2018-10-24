require_relative('../models/student')
require_relative('../models/house')
require('pry-byebug')


house1 = House.new({'name' => 'Gryffindor'})
house2 = House.new({'name' => 'Slytherin'})
house3 = House.new({'name' => 'Hufflepuff'})
house4 = House.new({'name' => 'Ravenclaw'})
house5 = House.new({'name' => 'Death Eaters'})

house1.save()
house2.save()
house3.save()
house4.save()
house5.save()


student1 = Student.new({'first_name' => 'Harry', 'last_name' => 'Potter', 'age' => 14, 'house_id' => house1.id})
student2 = Student.new({'first_name' => 'Ron', 'last_name' => 'Weasley', 'age' => 14, 'house_id' => house1.id})
student3 = Student.new({'first_name' => 'Hermione', 'last_name' => 'Granger', 'age' => 14, 'house_id' => house1.id})
student4 = Student.new({'first_name' => 'Draco', 'last_name' => 'Malfoy', 'age' => 14, 'house_id' => house2.id})
student5 = Student.new({'first_name' => 'Luna', 'last_name' => 'Lovegood', 'age' => 14, 'house_id' => house3.id})
student6 = Student.new({'first_name' => 'Cedric', 'last_name' => 'Diggory', 'age' => 17, 'house_id' => house4.id})

student1.save()
student2.save()
student3.save()
student4.save()
student5.save()
student6.save()
