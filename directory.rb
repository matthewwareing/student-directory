@students = []
def input_student
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # while the name is not empty, repeat this code
  while name = gets.chomp do
    break if name.empty?
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} student#{pluralise?(@students)}"
  end
  # return the array of students
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def pluralise? n
  "s" if n.count > 1
end

def print_student_list
  @students.each.with_index(1) do |student, i| 
    puts "#{i}.#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great student#{pluralise?(@students)}"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  if @students.count > 0
    print_header 
    print_student_list
    print_footer
  else
    puts "Please input some students before you print them!"
  end
end

def process(selection)
  case selection
    when "1"
      input_student
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu