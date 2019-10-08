def input_students
  puts "Please enter student profiles"
  puts "To finish enter empty values in all"
  puts "Enter a default cohort"
  default_cohort = gets.strip
  students = []
  $months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  puts "Enter a name"
  name = gets.strip

  puts "Enter cohort"
  cohort = gets.strip

  puts "Enter a hobby"
  hobby = gets.strip

  puts "Place of birth"
  p_o_b = gets.strip

  puts "Height"
  height = gets.strip.to_s

  if cohort.empty? || !$months.include?(cohort)
    cohort = default_cohort
  end

  while !name.empty? do
    students << {name: name, cohort: cohort, hobby: hobby, birthplace: p_o_b, height: height}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end

    puts "Enter a name"
    name = gets.strip

    puts "Enter cohort"
    cohort = gets.strip

    puts "Enter a hobby"
    hobby = gets.strip

    puts "Place of birth"
    p_o_b = gets.strip

    puts "Height"
    height = gets.strip.to_s

    if cohort.empty? || !$months.include?(cohort)
      cohort = default_cohort
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(180)
  puts "-------------".center(180)
end

def print(array, array2)
  if array.empty?
    puts "No students to display".center(180)
  else
    count = 0
    while count < array.count
      if array[count - 1][:name].start_with?("a") && array[count - 1][:name].length <= 12 && array[count][:cohort] == "january"
      array2.each { |month|
        puts "#{count + 1}. #{array[count][:name].capitalize}, Hobby: #{array[count][:hobby].capitalize}, Height: #{array[count][:height]}, Place of Birth: #{array[count][:birthplace]} (#{array[count][:cohort]} cohort)".center(180) if array[count][:cohort] == month  }
      end
      count +=1
    end
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student".center(180)
  else
    puts "Overall, we have #{names.count} great students".center(180)
  end
end

students = input_students
print_header
print(students, $months)
print_footer(students)
