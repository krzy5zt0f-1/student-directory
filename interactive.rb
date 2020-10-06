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
    when "9"
      exit  # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end

end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    process(selection)
  end
end

interactive_menu
