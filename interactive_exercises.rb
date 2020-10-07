@students = [] # an empty array accessible to all methods
# method to reduce repetiotion of
# @students << {name: name, cohort: cohort.to_sym}
# in interactive_menu and load_students
def ex1(name_input, cohort_input)
  @students << {name: name_input, cohort: cohort_input.to_sym}
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students; puts "Changes saved to students.csv"
  when "4"
    load_students; puts "Student data successfully loaded from students.cdv"
  else
    puts "I don't know what you meant, try again"
  end
end
# def of info when input_students used
def input_instructions
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
end

def input_students
  input_instructions
  name = STDIN.gets.chomp # get the first name
  while !name.empty? do # while the name is not empty, repeat this code
    # add the student hash to the array
    ex1(name, "november")
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each { |student| student_data = [student[:name], student[:cohort]];
                                            csv_line = student_data.join(",");
                                                          file.puts csv_line }
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each { |line| name, cohort = line.chomp.split(','); ex1(name, cohort) }
  file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  if filename.nil? # if no file given load students.csv
    load_students(); puts "Loaded #{@students.count} from students.csv"
  elsif File.exists?(filename) # if it exists
    load_students(filename); puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
