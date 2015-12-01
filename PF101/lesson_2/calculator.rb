# ask the user for 2 numbers
# ask for an operation to perform
# perform operation
# display result

def prompt(message)
  Kernel.puts("=> #{message}")
end

def get_valid_number
  loop do
    prompt "Please enter a non-zero number"
    n = gets.chomp.to_f
    return n if n != 0
  end
end

def get_operation
  valid = false
  until valid
    prompt "Please enter an operation +-*/ or q to quit"
    op = gets.chomp
    valid = %w(+ - * / q).include? op
  end
  op
end

def calculate(num1, num2, op)
  result =
  case op
  when '+'
    num1 + num2
  when '-'
    num1 - num2
  when '*'
    num1 * num2
  when '/'
    num1 / num2
  end
end

loop do
  prompt "Welcome to Calculator"
  a = get_valid_number
  b = get_valid_number

  op = get_operation
  break if op == 'q'
  puts a
  puts b
  puts op
  result = calculate(a, b, op)
  prompt "#{a} #{op} #{b} = #{result}"
end

puts "Thank you for playing Calculator!"
