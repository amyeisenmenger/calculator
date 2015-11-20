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
# make sure input isn't gibberish???

# hint 1
# num = gets.to_i
# operator = gets.to_sym
# num2 = gets.to_i
# hint 2

# str.gsub(" ","").split(/(\+|\-|\/|\*)/)
# string is any string "1+2 * 3"
# gsub takes 2 params 1st is param to find 2nd is what to replace it with
# gsub(" ", "") replaces all blank spaces 
# inside the split I used regex which is a way to search a string for a sub string
# so I am splitting on any + - / *
    
#   "1 + 2*3 -44" becomes ["1", "+", "2", "3", "-", "44]
# num.send(operator, num2)


add = -> (number_1, number_2) {number_1 + number_2}
sub = -> (number_1, number_2) {number_1 - number_2}
mul = -> (number_1, number_2) {number_1 * number_2}
@check_if_0 = -> (number_2) {'Error:cannot divide by 0' if number_2==0}
div = -> (number_1, number_2) {number_1.to_f/number_2 if @check_if_0.call(number_2)==nil}

@operations ={
   '+'=> add,
   '-'=> sub, 
   '*'=> mul,
   "/"=> div
}

@history = {}

def repeat_calculation
  question = 'yes'
  while question == 'yes'
    puts "Calculate again? yes/no"
    question = gets.strip.downcase
    if question == 'yes'
      ask_equation
    elsif question == 'no'
      puts 'Your calculation history is:'
      @history.each {|expression, answer| puts expression + " = #{answer}"}
      exit
    else
      puts 'Error: incorrect format'
      repeat_calculation
    end
  end
end

def clear(answer)
  puts 'Clear?'
  choice = gets.strip.downcase
  if choice == 'no'
    puts answer
    ask_equation(answer.to_i)
  else
    nil
  end
end

def calculate(number_1, operator, number_2)
  case operator
  when '+', '-', '*'
    answer = @operations[operator].call(number_1, number_2)   
  when '/'
    if number_2 == 0
      puts 'Error: cannot divide by 0'
    else
      answer = @operations[operator].call(number_1, number_2)
    end
  else
     puts 'Error: incorrect format or operator'
  end
  puts "#{answer}"
  @history["#{number_1} #{operator} #{number_2}"] = answer
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

ask_equation()





