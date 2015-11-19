# Basic Objectives
# 1. Create a ruby file called calculator.rb
# 2. Take user input for the left hand of the equation
# 3. Take user input for the operator of the equation
# 4. Take user input for the right hand of the equation
# 5. Calculate the correct answer and output it to the user
# 6. Handle cases: Addition, Subtraction, Division, and Multiplication
# Bonus Objectives
# 1. Refactor to only take user input once
# a. eg. What is the equation?
# i. user input: 1 + 1
# ii. hint: you’ll need to split the user input to get the values out
# 2. Organize your code to use methods
# 3. Handle more equations: PEMDAS, sin, cosin, square root, ect…
# 4. Have the calculator ask for new equations over and over
# a. hint: use a loop
# 5. Have the calculator store the last result so you can do a new equation and add to the
# previous result
# a. Have a clear function so you don’t keep adding to the last result if you don’t want
# to
# 6. Store a history of the users equations and answers
# a. hint: use hashes ­ you don’t really know this yet



# def calculate(left, operator, right)
# end

# puts 'input first #'
# num1 = gets.to_i

# puts 'input operator'
# operator = gets.strip

# puts 'input second #'
# num2 = gets.to_i

# make sure input isn't gibberish????
#   
def repeat_calculation
  question = 'yes'
  while question == 'yes'
    puts "Calculate again? yes/no"
    question = gets.strip.downcase
    if question == 'yes'
      ask_equation
    elsif question == 'no'
      exit
    else
      puts 'Error'
      repeat_calculation
    end
  end
end

def clear(answer)
  answer = answer
  puts 'Clear?'
  choice = gets.strip.downcase
  if choice == 'no'
    puts answer
    use_result(answer)
  else
    nil
  end
end

def add(number_1, number_2)
  number_1 + number_2
end

def subtract(number_1, number_2)
  number_1 - number_2
end

def multiply(number_1, number_2)
  number_1. * number_2
end

def divide(number_1, number_2)
  if number_2 == 0
    puts 'Error: cannot divide by 0'
  else
    number_1.to_f / number_2
  end
end

def calculate(num1, operator, num2)
  case operator
  when '+'
    answer = add(num1, num2)
  when '-'
    answer = subtract(num1, num2)
  when '*'
    answer = multiply(num1, num2)
  when '/'
    answer = divide(num1, num2)
  else
     puts 'Error'
  end
  puts "#{answer}"
  answer
end

def ask_equation(*num1)
  puts "What is the equation? E.g. 1 + 1"
  if num1
    puts num1
    equation = num1[0].to_s + ' ' + gets.strip
  else
    equation = gets.strip
  end
  puts equation
  if equation.include? (' ')
    eq_array = equation.split(' ')
    num1 = eq_array[0].to_i
    num2 = eq_array[2].to_i
    operator = eq_array[1]
    puts "#{num1} #{operator} #{num2} ="
  else
    puts 'Error: incorrect format'
  end
  clear(calculate(num1, operator, num2))
  repeat_calculation
end


def use_result(answer)
  answer = answer.to_i
  ask_equation(answer)
end

ask_equation()