def input_students
  puts "What cohort would you like to enter students for?"
  cohort = gets.chomp
  puts "Please enter the names of the students you'd like to enter for the #{cohort} cohort."
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy with names shorter than 12 characters"
  puts "-------------"
end
def print(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
