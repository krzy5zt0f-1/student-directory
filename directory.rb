# input_users method makes it great to eliminate hard-coded student data
def input_students
 puts "Please enter the names of students"
 puts "To finish, just hit return twice"
 # create an empty array
 students = []
 name = gets.chomp.capitalize
 # while the name is not empty, repeat this code
 while !name.empty? do
   #add student hash to the array
   students << { name: name, cohort: "november"}
   puts "Now we have #{students.size} students"
   name = gets.chomp.capitalize
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
  puts "Chose the first letter of names of students to print"
  puts "To print the whole list just hit return"
  input = gets.strip.upcase
  letter = input[0]

  if letter == nil
    print_header
    names.each.with_index(1) { |x, index| puts "#{index}. #{x[:name]} (#{x[:cohort]} cohort)" }
  else
    puts "The students of Villains Academy with names starting with letter `#{letter}`"
    puts "-------------"
    for i in 1..names.size
      puts "#{i}. #{names[i - 1][:name]} (#{names[i - 1][:cohort]} cohort)" if names[i - 1][:name][0] == letter
    end
  end
end

def print_footer(names)
 puts "Over all, we have #{names.size} great students"
end
#nothing happens until we call the methods
students = input_students
print(students)
print_footer(students)
