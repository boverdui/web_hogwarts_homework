require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/house.rb')
require_relative('./models/student.rb')
require('pry-byebug')

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  @houses = House.all()
  erb(:new)
end

get '/students/:id' do
  @student = Student.find(params[:id].to_i)
  @house = @student.house()
  erb(:show)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  redirect to '/students'
end
