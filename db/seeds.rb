require_relative('../models/house')
require_relative('../models/student')

Student.delete_all()
House.delete_all()

house1 = House.new({
  "name" => "Gryffindor",
  "logo_url" => "/logos/gryffindor.png"
})

house2 = House.new({
  "name" => "Hufflepuff",
  "logo_url" => "/logos/hufflepuff.png"
})

house3 = House.new({
  "name" => "Ravenclaw",
  "logo_url" => "/logos/ravenclaw.png"
})

house4 = House.new({
  "name" => "Slytherin",
  "logo_url" => "/logos/slytherin.png"
})

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 12
})

student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => house1.id,
  "age" => 12
})

student3 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house_id" => house1.id,
  "age" => 12
})

student1.save()
student2.save()
student3.save()
