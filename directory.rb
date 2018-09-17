def input_students
  @possible_cohorts = ["January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
]
  puts "Please enter the name of the first student you'd like to enter"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Which cohort does #{name} belong to?"
    cohort = gets.chomp.capitalize
    while @possible_cohorts.include?(cohort) == false
      puts "Please enter a correct cohort."
      cohort = gets.chomp.capitalize
    end
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
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    puts "What is the next student's name?(If none, hit return)"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
    puts "is #{student[:height]}m tall, was born #{student[:DOB]} and likes #{student[:hobby]}".center(100)
  end
end
def print_by_cohort(students)
  @possible_cohorts.each do |month|
    if students.any? { |student| student[:cohort] == month.to_sym }
      puts "#{month}:".center(100)
    end
    students.each do |student|
      if student[:cohort] == month.to_sym
        puts student[:name].center(100)
      end
    end
  end
end
def print_footer(students)
  puts "-------------".center(100)
  if students.count == 1
    puts "Overall, we have #{students.count} great student.".center(100)
  else
    puts "Overall, we have #{students.count} great students.".center(100)
  end
end

students = input_students
print_header
print_by_cohort(students)
print_footer(students)
