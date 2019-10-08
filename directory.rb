def input_students
  puts "Please enter student profiles"
  puts "To finish enter empty values in all"
  default_cohort = "november"
  @students = []
  @months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  puts "Enter a name"
  name = gets.strip

  puts "Enter cohort"
  cohort = gets.strip

  puts "Enter a hobby"
  hobby = gets.strip

  puts "Place of birth"
  birthplace = gets.strip

  puts "Height"
  height = gets.strip.to_s

  if cohort.empty? || !@months.include?(cohort)
    cohort = default_cohort
  end

  while !name.empty? do
    @students << {name: name, cohort: cohort, hobby: hobby, birthplace: birthplace, height: height}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end

    puts "Enter a name"
    name = gets.strip

    puts "Enter cohort"
    cohort = gets.strip

    puts "Enter a hobby"
    hobby = gets.strip

    puts "Place of birth"
    birthplace = gets.strip

    puts "Height"
    height = gets.strip.to_s

    if cohort.empty? || !@months.include?(cohort)
      cohort = default_cohort
    end
  end
end

def print_header
  puts "The students of Villains Academy".center(180)
  puts "-------------".center(180)
end

def print_students_list
  if @students.empty?
    puts "No students to display".center(180)
  else
    count = 0
    while count < @students.count
      if @students[count - 1][:name].start_with?("a") && @students[count - 1][:name].length <= 12 && @students[count][:cohort] == "november"
      @months.each { |month|
        puts "#{count + 1}. #{@students[count][:name].capitalize}, Hobby: #{@students[count][:hobby].capitalize}, Height: #{@students[count][:height]}, Place of Birth: #{@students[count][:birthplace]} (#{@students[count][:cohort]} cohort)".center(180) if @students[count][:cohort] == month  }
      end
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
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
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
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, hobby, birthplace, height = line.chomp.split(',')
    @students << {name: name, cohort: cohort, hobby: hobby, birthplace: birthplace, height: height}
  end
  file.close
end
interactive_menu
