def input_students
  puts "Please enter the names of the students you'd like to enter"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Which cohort does #{name} belong to?"
    cohort = gets.chomp
    puts "What is #{name}'s hobby?"
    hobby = gets.chomp
    puts "What is #{name}'s height (in metres)?"
    height = gets.chomp
    puts "What is #{name}'s date of birth (in format DD/MM/YYYY)?"
    dob = gets.chomp
    students << {name: name,
      cohort: cohort.to_sym,
      hobby: hobby.to_sym,
      height: height.to_sym,
      DOB: dob.to_sym
    }
    puts "Now we have #{students.count} students"
    puts "What is the next student's name?"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    puts "  is #{student[:height]}m tall, was born #{student[:DOB]} and likes #{student[:hobby]}"
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
