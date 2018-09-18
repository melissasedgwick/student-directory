@students = []

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student [:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

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
    @students << {name: name,
      cohort: cohort.to_sym,
      hobby: hobby.to_sym,
      height: height.to_sym,
      DOB: dob.to_sym
    }
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    puts "What is the next student's name?(If none, hit return)"
    name = gets.chomp
  end
  @students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
    puts "is #{student[:height]}m tall, was born #{student[:DOB]} and likes #{student[:hobby]}".center(100)
  end
end

def print_by_cohort
  @possible_cohorts.each do |month|
    if @students.any? { |student| student[:cohort] == month.to_sym }
      puts "#{month}:".center(100)
    end
    @students.each do |student|
      if student[:cohort] == month.to_sym
        puts student[:name].center(100)
      end
    end
  end
end

def print_footer
  puts "-------------".center(100)
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student.".center(100)
  else
    puts "Overall, we have #{@students.count} great students.".center(100)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

interactive_menu
