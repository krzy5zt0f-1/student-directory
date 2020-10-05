# input_users method makes it great to eliminate hard-coded student data
def input_students
 puts "Please enter the names of students".center(40)
 puts "To finish, just hit return twice".center(40)
 # create an empty array
 students = []
 name = gets.chomp.capitalize
 # while the name is not empty, repeat this code
 while !name.empty? do
   #add student hash to the array
   students << { name: name, cohort: "november", hobby: "being bad",
                  country_of_origin: "land of badness"}
   puts "Now we have #{students.size} students".center(40)
   name = gets.chomp.capitalize
 end
 # return the array of students
 students

end

# keep outputs as methods
#loop to print names and filter through alphabetically
def loop_for_print(arr, control)
  # empty bin with results form this definition to print at the end
  bin = []
  if control == nil
    bin << "The students of Villains Academy".center(40)
    bin << "-------------".center(40)
    i = 0
    while i != arr.size
      bin << "    #{i + 1}. #{arr[i][:name]} (#{arr[i][:cohort]} cohort)"
      i += 1
    end
  else
    bin << "The students of Villains Academy with names starting with letter `#{control}`".center(40)
    bin << "-------------".center(40)
    for i in 1..arr.size
      bin << "    #{i}. #{arr[i - 1][:name]} (#{arr[i - 1][:cohort]} cohort)" if arr[i - 1][:name][0] == control
    end
  end
  bin
end
# asks for correct input for  decision on whether
# to shorten the list to names thqt are 12 characters or shorter
def move
  loop do
    @input = gets.strip
    if @input == "y" || @input == "n"
      break
    end
  end
  @input
end

def print(names)

  puts "Chose the first letter of names of students to print".center(40)
  puts "To print the whole list just hit return".center(40)
  input = gets.strip.upcase
  letter = input[0]

  # option to print names of students of lenghts up to 12 characters
  puts "Would you like to view only students with names shorter than 12 characters? [y/n]".center(40)
  input = move
  input == "y" ? names_s = loop_for_print(names,letter).drop(2).select { |x| x.length > 37} : names_s = []
  puts (loop_for_print(names, letter) - names_s)


end

def print_footer(names)
 puts "Over all, we have #{names.size} great students".center(40)
end
#nothing happens until we call the methods
students = input_students
print(students)
print_footer(students)
