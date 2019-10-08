def input_students
  puts "Please enter student profiles"
  puts "To finish enter empty values in all"
  puts "Enter a default cohort"
  default_cohort = gets.chomp
  students = []
  $months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  puts "Enter a name"
  name = gets.chomp

  puts "Enter cohort"
  cohort = gets.chomp

  puts "Enter a hobby"
  hobby = gets.chomp

  puts "Place of birth"
  p_o_b = gets.chomp

  puts "Height"
  height = gets.chomp.to_s

  if cohort.empty? || !$months.include?(cohort)
    cohort = default_cohort
  end



  while !name.empty? do
    students << {name: name, cohort: cohort, hobby: hobby, birthplace: p_o_b, height: height}
    puts "Now we have #{students.count} students"

    puts "Enter a name"
    name = gets.chomp

    puts "Enter cohort"
    cohort = gets.chomp

    puts "Enter a hobby"
    hobby = gets.chomp

    puts "Place of birth"
    p_o_b = gets.chomp

    puts "Height"
    height = gets.chomp.to_s

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
  count = 0
  while count < array.count
      if array[count - 1][:name].start_with?("a") && array[count - 1][:name].length <= 12 && array[count][:cohort] == "january"
      array2.each { |month|
          puts "#{count + 1}. #{array[count][:name].capitalize}, Hobby: #{array[count][:hobby].capitalize}, Height: #{array[count][:height]}, Place of Birth: #{array[count][:birthplace]} (#{array[count][:cohort]} cohort)".center(180) if array[count][:cohort] == month  }
      end
      count +=1
  end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students".center(180)
end

students = input_students
print_header
print(students, $months)
print_footer(students)
