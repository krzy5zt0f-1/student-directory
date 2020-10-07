@students = Array.new # an empty array for all methods to access

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
  @students << {name: name, cohort: "november"}
  puts "Now we have #{@students.count} students"
  # get another name from the user
  name = gets.chomp
  end
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]})" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  # 1. Print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_
  print_footer(students)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      print_header
      print_
      print_footer
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit  # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end

end
# function that saves the students input into csv file
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
# funtion that loads the csv file data
def load_students
  # open file and get it to be read by `r`
  file = File.open("students.csv", "r")
  # iterate over the file content
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << { name: name, cohort: cohort.to_sym}
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    process(selection)
  end
end

interactive_menu
