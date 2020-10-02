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
 # keep outputs as methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each { |x| puts x }
end

def print_footer(names)
  puts "Over all, we have #{names.size} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
