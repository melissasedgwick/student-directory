@students = []
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

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "5. Show the students, grouped by cohort"
  puts "9. Exit"
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
      puts "You've selected to input students:"
      input_students
    when "2"
      puts "You've selected to show students:"
      show_students
    when "3"
      save_students
      puts "You've saved the list of students"
    when "4"
      puts "Enter the file name you'd like to load from"
      load_students
      puts "You've loaded the list of students"
    when "5"
      puts "Students grouped by cohort:"
      print_by_cohort
    when "9"
      puts "Program ended."
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the name of the first student you'd like to enter"
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "Which cohort does #{name} belong to?"
    cohort = STDIN.gets.chomp.capitalize
    while @possible_cohorts.include?(cohort) == false
      puts "Please enter a correct cohort."
      cohort = STDIN.gets.chomp.capitalize
    end
    add_to_students(name, cohort)
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

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
  end
end

def print_by_cohort
  @possible_cohorts.each do |month|
    if @students.any? { |student| student[:cohort] == month.to_sym }
      puts "#{month}:".center(100)
      @students.each do |student|
        if student[:cohort] == month.to_sym
          puts student[:name].center(100)
        end
      end
      puts ""
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

def save_students
  puts "Save students to which file?"
    file_to_save_to = gets.chomp
  file = File.open(file_to_save_to, "w")
  @students.each do |student|
    student_data = [student[:name], student [:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = gets.chomp)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
      add_to_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
    puts "Loaded #{@students.count} students from students.csv"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def add_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
