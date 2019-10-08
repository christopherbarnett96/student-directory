@students = []
@months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
def input_students
  puts "Please enter student profiles"
  puts "To finish enter empty values in all"
  default_cohort = "november"
  puts "Enter a name"
  name = STDIN.gets.strip

  puts "Enter cohort"
  cohort = STDIN.gets.strip

  puts "Enter a hobby"
  hobby = STDIN.gets.strip

  puts "Place of birth"
  birthplace = STDIN.gets.strip

  puts "Height"
  height = STDIN.gets.strip.to_s

  if cohort.empty? || !@months.include?(cohort)
    cohort = default_cohort
  end

  while !name.empty? do
    add_student(name, cohort, hobby, birthplace, height)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end

    puts "Enter a name"
    name = STDIN.gets.strip

    puts "Enter cohort"
    cohort = STDIN.gets.strip

    puts "Enter a hobby"
    hobby = STDIN.gets.strip

    puts "Place of birth"
    birthplace = STDIN.gets.strip

    puts "Height"
    height = STDIN.gets.strip.to_s

    if cohort.empty? || !@months.include?(cohort)
      cohort = default_cohort
    end
  end
end

def add_student(name, cohort, hobby, birthplace, height)
  @students << {name: name, cohort: cohort, hobby: hobby, birthplace: birthplace, height: height}
end

def print_header
  puts "The students of Villains Academy".center(180)
  puts "-------------".center(180)
end

def print_students_list
  if @students.empty?
    puts "No students to display".center(180)
  else
    count = 1
    @students.each do |student|
      @months.each { |month|
        puts "#{count}. #{student[:name]}, Hobby: #{student[:hobby]}, Height: #{student[:height]}, Place of Birth: #{student[:birthplace]} (#{student[:cohort]} cohort)".center(180) if student[:cohort] == month  }
      count +=1
    end
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(180)
  else
    puts "Overall, we have #{@students.count} great students".center(180)
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show all students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Show select students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def show_select_students
  puts "Choose which cohort to show"
  month = STDIN.gets.strip
  puts "Starting with what letter?"
  letter = STDIN.gets.strip
  count = 1
  @students.each do |student|
    if student[:cohort] == month && student[:name].start_with?(letter) && student[:name].length <= 12
      puts "#{count}. #{student[:name]}, Hobby: #{student[:hobby]}, Height: #{student[:height]}, Place of Birth: #{student[:birthplace]} (#{student[:cohort]} cohort)".center(180)
      count += 1
    end
  end
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "5"
    show_select_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:birthplace], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Student(s) saved"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobby, birthplace, height = line.chomp.split(',')
    @students << {name: name, cohort: cohort, hobby: hobby, birthplace: birthplace, height: height}
  end
  file.close
  puts "-------------------".center(180)
  puts "Loaded #{filename}".center(180)
  puts "-------------------".center(180)
end

def try_load_students
  ARGV.first != nil ? filename = ARGV.first : filename = "students.csv"
  load_students(filename)
end
try_load_students
interactive_menu
