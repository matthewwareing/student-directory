@students = []

def input_student
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  while name = STDIN.gets.chomp do
    break if name.empty?
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} student#{pluralise?(@students)}"
  end
  @students
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_student
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

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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

def print_student_list
  @students.each.with_index(1) do |student, i| 
    puts "#{i}.#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def pluralise? n
  "s" if n.count > 1
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_footer
  puts "Overall, we have #{@students.count} great student#{pluralise?(@students)}"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << { name: name, cohort: cohort.to_sym }
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu