# input_users method makes it great to eliminate hard-coded student data
def input_students
  # months hash to define cohort intake for each student
months = {
  1 => "January",
  2 => "February",
  3 => "March",
  4 => "April",
  5 => "May",
  6 => "June",
  7 => "July",
  8 => "August",
  9 => "September",
  10 => "October",
  11 => "Novemebr",
  12 => "Decemebr",
}
 puts "Please enter the names of students".center(40)
 puts "To finish, just hit return twice".center(40)
 puts " and select any arbitrarry cohort".center(40)
 # create an empty arrays for students storage
 students = []
 name = gets.chomp.capitalize
 # asks for the cohort of a student
  puts "To choose the cohort".center(40)
  puts "of the student inlucde it as an integer,".center(40)
  puts "i.e. 1 -> January, 9 -> September.".center(40)
  month = from1to12
 # while the name is not empty, repeat this code
 while !name.empty? do
   #add student hash to the array
   students << { name: name, cohort: months[month], hobby: "being bad",
                  country_of_origin: "land of badness"}
   puts "Now we have #{students.size} students".center(40)
   name = gets.chomp.capitalize
   puts "Specify cohort".center(40)
   month = from1to12
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
      bin << "    #{i + 1}. #{arr[i][:name]}; #{arr[i][:cohort]} cohort"
      i += 1
    end
  else
    bin << "The students of Villains Academy with names starting with letter `#{control}`".center(40)
    bin << "-------------".center(40)
    for i in 1..arr.size
      bin << "    #{i}. #{arr[i - 1][:name]}; #{arr[i - 1][:cohort]} cohort" if arr[i - 1][:name][0] == control
    end
  end
  bin
end
# asks for correct input for  decision on whether
# to shorten the list to names that are 12 characters or shorter
def move
  loop do
    @input = gets.strip
    if @input == "y" || @input == "n"
      break
    end
  end
  @input
end
 # askas for correct cohort input
def from1to12
  a = Array(1..12)
  loop do
    @number = gets.strip.to_i
    if a.include?(@number)
      break
    end
  end
  @number
end

def print(names)

  puts "Chose the first letter of names of students to print".center(40)
  puts "To print the whole list just hit return".center(40)
  input = gets.strip.upcase
  letter = input[0]
  # option to print names of students of lenghts up to 12 characters
  puts "Would you like to view only students with names shorter than 12 characters? [y/n]".center(40)
  input = move
  input == "y" ? names_s = loop_for_print(names,letter).drop(2).select { |x| x[x.index(".")..x.index(";")].length > 15} : names_s = []
  puts (loop_for_print(names, letter) - names_s)

end

def print_footer(names)
 puts "Over all, we have #{names.size} great students".center(40)
end
#nothing happens until we call the methods
students = input_students
print(students)
print_footer(students)
