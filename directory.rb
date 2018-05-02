def input_student
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # while the name is not empty, repeat this code
  while name = gets.chomp do
    break if name.empty?
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each.with_index(1) {|student, i| puts "#{i}.#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_beginning_with_s(names)
  names.each {|student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == "s"
  }
end

def print_less_than_12(names)
  names.each {|student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
  }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_student
print_header
# print(students)
# print_beginning_with_s(students)
print_less_than_12(students)
print_footer(students)