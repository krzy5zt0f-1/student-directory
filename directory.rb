# store students in an array
students = [
  "Dr Hannibal Lecter",
  "Darth vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
students_count = students.size
 # The intro
puts "The students of Villains Academy"
puts "-------------"
# iterate through the students array
students.each { |x| puts x }
# finally, we print the total number of students
print "Over all, we have #{students_count} great students"
