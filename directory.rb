# input_users method makes it great to eliminate hard-coded student data
def input_students
 puts "Please enter the names of students"
 puts "To finish, justhit return twice"
 # create an empty array
 students = []
 name = gets.chomp
 # while the name is not empty, repeat this code
 while !name.empty? do
   #add student hash to the array
   students << { name: name, cohort: "november"}
   puts "Now we have #{students.size} students"
   name = gets.chomp
 end
 # return the array of students
 students

end

# keep outputs as methods
def print_header
 puts "The students of Villains Academy"
 puts "-------------"
end

def print(names)
 names.each { |x| puts "#{x[:name]} (#{x[:cohort]} cohort)" }
end

def print_footer(names)
 puts "Over all, we have #{names.size} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
