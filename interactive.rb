@students = Array.new # an empty array for all methods to access

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
  add_students
  puts "Now we have #{@students.count} students"
  # get another name from the user
  name = STDIN.gets.chomp
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
def load_students(filename = "students.csv")
  # open file and get it to be read by `r`
  file = File.open(filename, "r")
  # iterate over the file content
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_students
  end
  file.close
end
# finction to try to load studenrts from a  file declared from the command line
def try_load_students
  filename = ARGV.first # first argument from command line
  return if filename.nil? # gets out of the method if it is not given
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it does not exist
    puts "Sorry, #{filename} does not exist"
    exit # quit the program
  end
end
# function to add hash to @students
def add_students
  @students << { name: name, cohort: cohort.to_sym}
end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    process(STDIN.gets.chomp)
  end
end
try_load_students
interactive_menu
