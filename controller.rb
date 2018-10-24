require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative("models/student")
require_relative("models/house")

get "/" do
  erb(:home)
end

get "/all-students" do
  @students = Student.find_all()
  erb(:index)
end

get "/home/new-student" do
  @houses = House.find_all()
  erb(:new)
end

post "/create-student" do
  @student = Student.new(params)
  @student.save
  redirect to "/all-students"
end
